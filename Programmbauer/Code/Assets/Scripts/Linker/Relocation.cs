using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Linker
{
    public struct Relocation
    {
        public enum Type
        {
            Standard = 0,
            Low = 0,
            High,
            HighAlgebraic,
        }

        /// <summary>
        /// If true, the value of the relocation needs to be subtracted by byteoffset of this relocation
        /// </summary>
        public bool isPCRelative;

        /// <summary>
        /// The offset in bytes from the beginning of the section (1 Byte == 32 Bits)
        /// </summary>
        public int byteOffset;

        /// <summary>
        /// The offset in bits from the beginning of this byte (1 Byte == 32 Bits)
        /// </summary>
        public int bitOffset;
        
        /// <summary>
        /// How many bits are affected by this relocation
        /// </summary>
        public int amountOfBits;

        /// <summary>
        /// The bitmask for the Byte, where each affected bit is high (1 Byte == 32 Bits)
        /// </summary>
        public int bitMask;

        /// <summary>
        /// This value stems from some constant expression and needs to be added onto the value of the symbol
        /// </summary>
        public int valueOffset;

        /// <summary>
        /// The name of the symbol that this relocation refers to
        /// </summary>
        public string symbolName;

        /// <summary>
        /// The type of relocation. See Relocation.Type
        /// </summary>
        public Type type;

        public static Type ToType(string type)
        {
            switch (type)
            {
                case "@l": return Type.Standard;
                case "@h": return Type.High;
                case "@ha": return Type.HighAlgebraic;
            }
            throw new System.ArgumentException();
        }
    }
}