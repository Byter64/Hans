using System;

namespace Linker
{
    public class LinkerException : Exception
    {
        public LinkerException(string message) : base(message)
        {
            Log.Instance.Print("LINKER ERROR: " + message);
        }
    }
}
