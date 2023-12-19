using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using UnityEngine;

namespace Linker
{
    public class Linker : MonoBehaviour
    {
        private const string resultFileName = "program.bin";
        public void LinkInFolder(string path, string pathForResult)
        {
            List<ObjectFileData> objectFileData = ParseFiles(path);
            List<Symbol> symbols = new();
            foreach(ObjectFileData fileData in objectFileData)
            {
                symbols.AddRange(fileData.symbols);
            }

            foreach (ObjectFileData filaData in objectFileData)
            {
                ResolveRelocations(filaData, symbols);
            }

            byte[] programCode = CreateProgramCode(objectFileData);

            WriteProgram(pathForResult, programCode);
        }

        private List<ObjectFileData> ParseFiles(string path)
        {
            List<ObjectFileData> objectFileDatas = new();

            IEnumerable<string> files = Directory.GetFiles(path).Where(x => x.EndsWith(".out"));

            foreach (string file in files)
            {
                ObjectFileData newFileData = new ObjectFileData(file);

                //Check if any symbol has already been defined, throw exception if so
                foreach (Symbol symbol in newFileData.symbols)
                {
                    foreach (ObjectFileData fileData in objectFileDatas)
                    {
                        if (fileData.Contains(symbol))
                        {
                            string assemblyFile = RecreateLocationOfAssemblyFile(file);
                            throw new LinkerException($"Symbol \"{symbol.name}\" from file \"{assemblyFile}\" is already defined in \"{fileData.file}\"");
                        }
                    }
                }

                //Check if any section has already been defined, throw exception if so
                foreach (Section section in newFileData.sections)
                {
                    foreach (ObjectFileData fileData in objectFileDatas)
                    {
                        if (fileData.Contains(section))
                        {
                            string assemblyFile = RecreateLocationOfAssemblyFile(file);
                            throw new LinkerException($"Section \"{section.name}\" from file {assemblyFile} is already defined in {fileData.file}");
                        }
                    }
                }

                objectFileDatas.Add(newFileData);
            }

            return objectFileDatas;
        }

        private void ResolveRelocations(ObjectFileData fileData, List<Symbol> symbols)
        {
            foreach (Section section in fileData.sections)
            {
                foreach (Relocation relocation in section.relocations)
                {
                    IEnumerable<Symbol> symbolList = symbols.Where(x => relocation.symbolName == x);
                    if (symbolList.Count() == 0)
                        throw new LinkerException($"Relocation expects symbol \"{relocation.symbolName}\" but no such symbol has been declared");

                    Symbol symbol = symbolList.First();
                    int byteOffset = relocation.byteOffset * 4; //Convert from 32-Bit Bytes to 8-Bit Bytes
                    for (int i = 0; i < 4; i++)
                    {
                        int mask =relocation.bitMask >> ((3 - i) * 8);
                        int invertedMask = ~mask;
                        int value = Convert.ToInt32((symbol.value + relocation.valueOffset) >> ((3 - i) * 8));
                        int oldValue = section.data[byteOffset + i];
                        section.data[byteOffset + i] |= Convert.ToByte((oldValue & invertedMask) | (value & mask));
                    }
                }
            }
        }

        private static byte[] CreateProgramCode(List<ObjectFileData> objectFileData)
        {
            List<byte> programCode = new();

            foreach(ObjectFileData fileData in objectFileData)
            {
                foreach(Section section in fileData.sections)
                {
                    programCode.AddRange(section.data);
                }
            }

            return programCode.ToArray();
        }

        private static void WriteProgram(string path, byte[] programCode)
        {
            path += Path.DirectorySeparatorChar + resultFileName;

            if(File.Exists(path))
            {
                File.Delete(path);
            }

            File.WriteAllBytes(path, programCode);
        }
        
        /// <summary>
        /// Tries to find the original assembly file of a given object file. If it could not be found, the object file will be returned instead
        /// </summary>
        /// <param name="objectFile"></param>
        /// <returns></returns>
        private string RecreateLocationOfAssemblyFile(string objectFile)
        {
            string assemblyFile = objectFile.Remove(objectFile.LastIndexOf(Path.DirectorySeparatorChar));
            assemblyFile = assemblyFile.Remove(assemblyFile.LastIndexOf(Path.DirectorySeparatorChar));
            assemblyFile += objectFile.Substring(objectFile.LastIndexOf(Path.DirectorySeparatorChar));
            assemblyFile = assemblyFile.Remove(assemblyFile.LastIndexOf('.'));
            assemblyFile += ".asm";

            if(File.Exists(assemblyFile))
            {
                return assemblyFile;
            }
            else
            {
                return objectFile;
            }
        }
    }
}