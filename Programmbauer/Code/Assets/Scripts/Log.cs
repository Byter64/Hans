using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using UnityEngine.UIElements;

public class Log : MonoBehaviour
{
    public static Log Instance { get; private set; }

    private Label logText;
    private Queue<char> buffer;

    private void Awake()
    {
        if (Instance != null && Instance != this)
        {
            Destroy(gameObject);
            return;
        }
        Instance = this;
    }

    void Start()
    {
        logText = ButtonAllocator.root.Query<VisualElement>("Log").First().Query<Label>("Text").First();
        buffer = new Queue<char>();
        StartCoroutine(PrintLog());
    }

    private IEnumerator PrintLog()
    {
        while(true)
        {
            yield return new WaitForSeconds(0.01f);

            if(buffer.Count > 0)
            {
                logText.text += buffer.Dequeue();
            }
        }
    }

    public void Print(string text)
    {
        foreach(char c in text)
        {
            buffer.Enqueue(c);
        }
    }

    public void Print(StreamReader reader)
    {
        StartCoroutine(PrintStream(reader));
    }

    private IEnumerator PrintStream(StreamReader reader)
    {
        while(reader != null)
        {
            while(reader != null && reader.EndOfStream)
                yield return null;
            
            Print(reader.ReadToEnd());
        }
    }
}
