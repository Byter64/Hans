using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Linker
{
    public struct Section
    {
        public string name;

        public byte[] data { get; set; }
        public List<Relocation> relocations;

        public Section(string name, string dataAsText, List<Relocation> relocations)
        {
            this.name = name;
            this.relocations = relocations;
            data = null;

            data = ConvertStringToData(dataAsText);
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