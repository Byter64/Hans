using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using UnityEngine;

namespace Linker
{
    public class Linker : MonoBehaviour
    {
        public void LinkInFolder(string path)
        {
            List<ObjectFileData> objectFileData = ParseFiles(path);
            List<Symbol> symbols = new();
            foreach(ObjectFileData fileData in objectFileData)
            {
                symbols.AddRange(fileData.symbols);
            }

            ResolveRelocations(objectFileData, symbols);
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

        private void ResolveRelocations(List<ObjectFileData> objectFileData, List<Symbol> symbols)
        {
            foreach(ObjectFileData fileData in objectFileData)
            {
                foreach(Section section in fileData.sections)
                {
                    foreach(Relocation relocation in section.relocations)
                    {
                        IEnumerable<Symbol> symbol = symbols.Where(x => relocation.symbolName == x);
                        if (symbol.Count() == 0)
                            throw new LinkerException($"Relocation expects symbol \"{relocation.symbolName}\" but no such symbol has been declared");
                        
                        //Weitermachen mit Relocation auflösen
                    }
                }
            }
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