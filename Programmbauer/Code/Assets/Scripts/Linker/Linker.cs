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
            int absoluteProgramOffset = 0;
            
            foreach(ObjectFileData fileData in objectFileData)
            {
                AddSymbols(symbols, fileData.symbols);
                for(int i = 0; i < fileData.sections.Count; i++)
                {
                    Section section = fileData.sections[i];
                    section.SetStartAdress(absoluteProgramOffset);
                    fileData.sections[i] = section;
                    absoluteProgramOffset += section.data.Length / 4;
                    AddSymbols(symbols, section.symbols);
                }
            }

            foreach (ObjectFileData filaData in objectFileData)
            {
                ResolveRelocations(filaData, symbols);
            }

            byte[] programCode = CreateProgramCode(objectFileData);

            WriteProgram(pathForResult, programCode);
        }

        private void AddSymbols(List<Symbol> symbols, List<Symbol> tobeAdded)
        {
            foreach (Symbol symbol in tobeAdded)
            {
                AddSymbol(symbols, symbol);
            }
        }
        private void AddSymbol(List<Symbol> symbols, Symbol symbol)
        {
            if(symbols.Where(x => x == symbol && x.value == null).Count() != 0)
            {
                symbols.Remove(symbol);
                symbols.Add(symbol);
            }
            else if (symbols.Where(x => x == symbol && x.value != null).Count() != 0 && symbol.value != null)
            {
                throw new LinkerException($"The symbol {symbol.name} was defined two times");
            }
            else if(!symbols.Contains(symbol)) 
            { 
                symbols.Add(symbol);
            }
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
                        if (fileData.ContainsValid(symbol) && symbol.value != null)
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
                    int byteOffset = (relocation.byteOffset + section.StartAdress) * 4; //Convert from 32-Bit Bytes to 8-Bit Bytes

                    int relocValue = symbol.value.Value + relocation.valueOffset;
                    if (relocation.isPCRelative)
                        relocValue -= (relocation.byteOffset + section.StartAdress);

                    for (int i = 0; i < 4; i++)
                    {
                        int byteMask = relocation.bitMask & (255 << ((3 - i) * 8));
                        byteMask >>= (3 - i) * 8;
                        int byteValue = relocValue        & (255 << ((3 - i) * 8));
                        byteValue >>= (3 - i) * 8;
                        
                        int invertedByteMask = ~byteMask & 255;
                        int oldValue = section.data[byteOffset + i];

                        section.data[byteOffset + i] |= Convert.ToByte((oldValue & invertedByteMask) | (byteValue & byteMask));
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