using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using UnityEngine;

public class Assemblying : MonoBehaviour
{
    [SerializeField]
    private string pathToAssembler;

    public void AssembleInFolder(string path)
    {
        string[]allFilePaths = Directory.GetFiles(path);
        IEnumerable<string> assemblyFilePaths = allFilePaths.Where(x => x.EndsWith(".asm"));

        foreach (string file in assemblyFilePaths)
        {
            string outputFilePath = file.Remove(file.LastIndexOf('.')) + ".out";
            Process assembler = new Process();
            assembler.StartInfo.FileName = Application.dataPath + pathToAssembler;
            assembler.StartInfo.Arguments = path + " -Fhans -o " + outputFilePath;
            assembler.StartInfo.UseShellExecute = false;
            assembler.StartInfo.RedirectStandardOutput = true;
            assembler.Start();

            assembler.WaitForExit();
        }
    }
}
