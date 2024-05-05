using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using UnityEngine;

namespace Linker
{
    [DebuggerDisplay("{name}, Adress = {StartAdress}")]
    public class Section
    {
        public int StartAdress { get; private set; }
        public string name;

        public byte[] data { get; set; }
        public List<Relocation> relocations;
        public List<Symbol> symbols;

        public Section(string name, string dataAsText, List<Relocation> relocations, List<Symbol> symbols)
        {
            StartAdress = 0;
            this.name = name;
            this.relocations = relocations;
            this.symbols = symbols;
            data = null;

            data = ConvertStringToData(dataAsText);
        }

        public void SetStartAdress(int startAdress)
        {
            for(int i = 0; i < symbols.Count; i++)
            {
                Symbol symbol = symbols[i];
                if (symbol.value == null) continue;

                symbol.value -= StartAdress;
                symbol.value += startAdress;
                symbols[i] = symbol;
            }

            StartAdress = startAdress;
        }

        private byte[] ConvertStringToData(string dataAsText)
        {
            if(dataAsText.Length % 2 != 0)
                throw new ArgumentException();

            //2 Hex digits are needed to form one Byte, 8 Bit
            data = new byte[dataAsText.Length / 2];

            for(int i = 0; i < dataAsText.Length; i += 2)
            {
                int dataIndex = i / 2;
                string byteString = "" + dataAsText[i] + dataAsText[i + 1];
                data[dataIndex] = Convert.ToByte(byteString, 16);
            }

            return data;
        }

        public static bool operator ==(Section left, Section right)
        {
            return left.name == right.name;
        }

        public static bool operator !=(Section left, Section right)
        {
            return !(left == right);
        }
    }
}