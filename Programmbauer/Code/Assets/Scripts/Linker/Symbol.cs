using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using UnityEngine;

namespace Linker
{
    [DebuggerDisplay("{name}, value = {value}")]
    public struct Symbol
    {
        public string name;
        public int? value;
        public bool isPCAdress;

        public Symbol(string name, int? value, bool isPCAdress)
        {
            this.name = name;
            this.value = value;
            this.isPCAdress = isPCAdress;
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

        public override bool Equals(object obj)
        {
            return obj is Symbol symbol &&
                   name == symbol.name;
        }

        public override int GetHashCode()
        {
            return HashCode.Combine(name);
        }
    }
}