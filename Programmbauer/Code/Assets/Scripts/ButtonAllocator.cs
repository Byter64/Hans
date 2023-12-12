using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.UIElements;

public class ButtonAllocator : MonoBehaviour
{
    [SerializeField] UnityEvent<string> assembleMethod;
    [SerializeField] UnityEvent linkMethod;

    public StreamReader LogStream { set; get; }

    private VisualElement root;
    private Button assembleButton;
    private Button linkButton;
    private Label logText;

    // Start is called before the first frame update
    void Awake()
    {
        root = GetComponent<UIDocument>().rootVisualElement;

        assembleButton = root.Query<Button>("Assemble").First();
        linkButton = root.Query<Button>("Link").First();
        logText = root.Query<Label>("Text").First();

        assembleButton.clicked += OnAssembleButton;
        linkButton.clicked += OnLinkButton;

        StartCoroutine(PrintLog());
    }

    private void OnAssembleButton()
    {
        assembleMethod.Invoke("C:\\Users\\Yanni\\Desktop\\AssemblyTemp");
    }

    private void OnLinkButton()
    {
        linkMethod.Invoke();
    }

    private IEnumerator PrintLog()
    {
        while (LogStream != null && !LogStream.EndOfStream) 
        {
            logText.text += (char)LogStream.Read();
            yield return new WaitForSeconds(0.02f);
        }

        StartCoroutine(PrintLog());
    }
}
