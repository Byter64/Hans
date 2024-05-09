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
	[SerializeField]
	private UnityEvent clearLogMethod;

	public static ButtonAllocator Instance { get; private set; }
    public static VisualElement root { get; private set; }
    public static Toggle outputToggle;
    public StreamReader LogStream { set; get; }

    private Button assembleButton;
    private Button linkButton;
    private TextField projectPath;
    private TextField resultPath;

    public static Toggle ClearLogBeforeAssemblyToggle { get; set; }
    private Button clearLogButton;

    private string ActiveDirectory { get { return projectPath.text; } }
    private string ResultDirectory { get { return resultPath.text; } }

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

        projectPath = root.Query<TextField>("Projektpfad").First();
        resultPath = root.Query<TextField>("Ergebnispfad").First();
        outputToggle = root.Query<Toggle>("OutputToggle").First();

        clearLogButton = root.Query<Button>("LogLeeren").First();
		ClearLogBeforeAssemblyToggle = root.Query<Toggle>("LogVorAssemblenLeeren").First();
        clearLogButton.clicked += OnClearLog;
    }

    private void OnAssembleButton()
    {
        assembleMethod.Invoke(ActiveDirectory);
    }

    private void OnLinkButton()
    {
        linkMethod.Invoke(ActiveDirectory + "/ObjectFiles", ResultDirectory);
    }

    private void OnClearLog()
    {
        clearLogMethod.Invoke();
	}
}
