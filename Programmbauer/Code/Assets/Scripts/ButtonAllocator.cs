using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.UIElements;

public class ButtonAllocator : MonoBehaviour
{
    [SerializeField] 
    private UnityEvent<string> assembleMethod;
    [SerializeField] 
    private UnityEvent<string, string> linkMethod;

    public static ButtonAllocator Instance { get; private set; }
    public static VisualElement root { get; private set; }
    public StreamReader LogStream { set; get; }

    private Button assembleButton;
    private Button linkButton;
    private string activeDirectory = "C:\\Users\\Yanni\\Desktop\\AssemblyTemp";


    void Awake()
    {
        if(Instance != null && Instance != this)
        {
            Destroy(gameObject);
            return;
        }

        Instance = this;
        root = GetComponent<UIDocument>().rootVisualElement;

        assembleButton = root.Query<Button>("Assemble").First();
        linkButton = root.Query<Button>("Link").First();
        

        assembleButton.clicked += OnAssembleButton;
        linkButton.clicked += OnLinkButton;
    }

    private void OnAssembleButton()
    {
        assembleMethod.Invoke(activeDirectory);
    }

    private void OnLinkButton()
    {
        linkMethod.Invoke(activeDirectory + "/ObjectFiles", activeDirectory);
    }
}