using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using UnityEngine;

namespace Linker
{
    public class ObjectFileData
    {
        private const int numberOfElementsInRelocation = 8;
        private const string symbolMarker = "Symbole:";
        private const string sectionMarker = "Abschnitte:";
        private const string relocationMarker = "Relokationen:";
        private const string dataMarker = "Daten:";
        private const string unknownValue = "?";

        public string file;
        public List<Symbol> symbols = new();
        public List<Section> sections = new();

        public ObjectFileData(string pathToObjectFile)
        {
            file = pathToObjectFile;

            string content = File.ReadAllText(file);
            ParseFile(content);
        }

        private void ParseFile(string content)
        {
            string[] parts = content.Split();
            parts = parts.Where(part => string.IsNullOrEmpty(part) == false).ToArray();

            int i;
            #region Parse Symbols
            i = 0;

            while (i < parts.Length && parts[i] != symbolMarker)
                i++;
            i++;

            while(i < parts.Length && (parts[i].StartsWith('.')))
            {
                string name = parts[i].Substring(1, parts[i].LastIndexOf(':') - 1);
                if (name == "__VASM" || name == "__MSDOSFS")
                {
                    i++;
                    continue;
                }
                string valueAsString = parts[i].Substring(parts[i].LastIndexOf(':') + 1);
                int? value = valueAsString == unknownValue ? null : Convert.ToInt32(valueAsString);
                symbols.Add(new Symbol(name, value, false));
                i++;
            }

            #endregion

            #region Parse Sections
            i = 0;

            while (i < parts.Length && parts[i] != sectionMarker)
                i++;

            i++;
            while(i < parts.Length)
            {
                string name = parts[i].Remove(parts[i].LastIndexOf(':'));

                //find symbols in section
                while (i < parts.Length && parts[i] != symbolMarker)
                    i++;
                i++;
                List<Symbol> sectionSymbols = new List<Symbol>();

                while (i < parts.Length && (parts[i].StartsWith('.')))
                {
                    string labelName = parts[i].Substring(1, parts[i].LastIndexOf(':') - 1);
                    string valueAsString = parts[i].Substring(parts[i].LastIndexOf(':') + 1);
                    int? value = valueAsString == unknownValue ? null : Convert.ToInt32(valueAsString);
                    sectionSymbols.Add(new Symbol(labelName, value, true));
                    i++;
                }

                List<Relocation> relocations = new ();

                if (parts[i] != relocationMarker)
                    throw new LinkerException($"Expected \"{relocationMarker}\" but found \"{parts[i]}\" in file \"{file}\", section \"{name}\"");
                i++;

                //Parse Relocations
                int relocationIndex = 0;
                while (parts[i].StartsWith('<'))
                {
                    string relocationAsText = parts[i].Substring(1);
                    relocationAsText = relocationAsText.Remove(relocationAsText.Length - 1);
                    string[] data = relocationAsText.Split(',');
                    if (data.Length != numberOfElementsInRelocation)
                        throw new LinkerException($"Relocation {relocationIndex} in section \"{name}\" does not have the right amount of members in file \"{file}\"");

                    Relocation relocation;
                    relocation.byteOffset = Convert.ToInt32(data[0]);
                    relocation.bitOffset = Convert.ToInt32(data[1]);
                    relocation.amountOfBits = Convert.ToInt32(data[2]);
                    relocation.bitMask = Convert.ToInt32(data[3]);
                    relocation.valueOffset = Convert.ToInt32(data[4]);
                    relocation.symbolName = data[5];
                    relocation.isPCRelative = Convert.ToBoolean(data[6]);
                    relocation.type = Relocation.ToType(data[7]);

                    relocations.Add(relocation);
                    relocationIndex++;
                    i++;
                }

                //Parse Data
                if (parts[i] != dataMarker)
                    throw new LinkerException($"Expected \"{dataMarker}\" but found \"{parts[i]}\" in file \"{file}\"");
                i++;

                string sectionData = parts[i];
                sections.Add(new Section(name, sectionData, relocations, sectionSymbols));
                i++;
            }
            #endregion 

        }

        public bool ContainsValid(Symbol symbol)
        {
            bool isContained = false;

            if (symbols.Where(x => x == symbol && x.value != null).Count() != 0)
                isContained = true;

            foreach(Section section in sections)
            {
                if (section.symbols.Where(x => x == symbol && x.value != null).Count() != 0)
                    isContained = true;
            }

            return isContained;
        }

        public bool Contains(Section section)
        {
            return sections.Contains(section);
        }
    }
}