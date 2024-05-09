using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Runtime.CompilerServices;
using UnityEngine;

public class Assembler : MonoBehaviour
{
    public static Assembler Instance { get; private set; }
    public const string nameOfOutputDirectory = "ObjectFiles";

    private const string assemblyFileEnding = ".hasm";

    [SerializeField]
    private string pathToAssemblerWindows;
    [SerializeField]
    private string pathToAssemblerLinux;

    private string pathToAssembler;
    public Process lastAssemblyProcess;
    private void Awake()
    {
        if(Instance != null && Instance != this)
        {
            Destroy(gameObject);
            return;
        }
        Instance = this;

#if UNITY_EDITOR_WIN || UNITY_STANDALONE_WIN
        pathToAssembler = pathToAssemblerWindows;
#elif UNITY_EDITOR_LINUX || UNITY_STANDALONE_LINUX
        pathToAssembler = pathToAssemblerLinux;
#endif
    }

    public void Assemble(string directory)
    {
        if(ButtonAllocator.ClearLogBeforeAssemblyToggle.value)
        {
            Log.Instance.ClearLog();
        }

        try
        {
            string[] allFilePaths = Directory.GetFiles(directory, "*", SearchOption.AllDirectories);
            IEnumerable<string> assemblyFilePaths = allFilePaths.Where(x => x.EndsWith(assemblyFileEnding));
            if (assemblyFilePaths.Count() == 0) { return; }

            string outputDirectory = assemblyFilePaths.FirstOrDefault();
            outputDirectory = outputDirectory.Remove(outputDirectory.LastIndexOf(Path.DirectorySeparatorChar) + 1);
            outputDirectory += nameOfOutputDirectory + Path.DirectorySeparatorChar;

            if (Directory.Exists(outputDirectory))
            {
                Directory.Delete(outputDirectory, true);
            }
            Directory.CreateDirectory(outputDirectory);

            foreach (string file in assemblyFilePaths)
            {
                string fileName = file.Substring(file.LastIndexOf(Path.DirectorySeparatorChar) + 1);
                string outputFilePath = outputDirectory + fileName.Remove(fileName.LastIndexOf('.')) + ".out";
                string fullPathToAssembler = Application.streamingAssetsPath + "/" + pathToAssembler;
                string arguments = '"' + file + '"' + " -Fhans -o " + '"' + outputFilePath + '"';
                Log.Instance.Print('"' + fullPathToAssembler + '"' + " " + arguments + "\n");

                Process assembler = new Process();
                assembler.StartInfo.FileName = Application.streamingAssetsPath + "/" + pathToAssembler;
                assembler.StartInfo.Arguments = arguments;
                assembler.StartInfo.UseShellExecute = false;
                assembler.StartInfo.RedirectStandardOutput = true;
                assembler.StartInfo.RedirectStandardError = true;
                assembler.EnableRaisingEvents = true;
                lastAssemblyProcess = assembler;
                assembler.Exited += new EventHandler(PrintProgramOutput);

                assembler.Start();
                assembler.WaitForExit();

            }
        }
        catch (Exception ex)
        {
            Log.Instance.Print(ex.Message);
        }
    }

    private void PrintProgramOutput(object sender, EventArgs e)
    {
        Log.Instance.Print(lastAssemblyProcess.StandardOutput.ReadToEnd());
        Log.Instance.Print(lastAssemblyProcess.StandardError.ReadToEnd());
    }
}
