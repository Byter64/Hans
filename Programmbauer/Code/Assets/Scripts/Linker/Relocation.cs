using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Linker
{
    public struct Relocation
    {
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
        public long valueOffset;

        /// <summary>
        /// The name of the symbol that this relocation refers to
        /// </summary>
        public string symbolName;
    }
}