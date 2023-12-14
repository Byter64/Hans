using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Linker
{
    public struct Symbol
    {
        public string name;
        public int? value;

        public Symbol(string name, int? value)
        {
            this.name = name;
            this.value = value;
        }

        public static bool operator ==(Symbol left, Symbol right)
        {
            return left.name == right.name;
        }

        public static bool operator !=(Symbol left, Symbol right)
        {
            return !(left == right);
        }

        public static bool operator ==(string left, Symbol right)
        {
            return left == right.name;
        }

        public static bool operator !=(string left, Symbol right)
        {
            return !(left == right);
        }

        public static bool operator ==(Symbol left, string right)
        {
            return right == left;
        }

        public static bool operator !=(Symbol left, string right)
        {
            return !(left == right);
        }
    }
}