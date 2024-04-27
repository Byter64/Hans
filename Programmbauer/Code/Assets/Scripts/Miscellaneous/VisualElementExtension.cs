using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UIElements;

public static class VisualElementExtension
{
    /// <summary>
    /// Searches recursively through the whole tree with root as root for a VisualElement that is named name and returns the first VisualElement found.
    /// </summary>
    /// <param name="root">The element in which is searched</param>
    /// <param name="name">The name that is searched</param>
    /// <returns>The first VisualElement with name name, or null if nothing was found</returns>
    public static VisualElement FindVisualElement(this VisualElement root, string name)
    {
        if (root.name == name)
        {
            return root;
        }

        foreach (VisualElement element in root.Children())
        {
            VisualElement tasks = FindVisualElement(element, name);
            if (tasks != null) return tasks;
        }

        return null;
    }
}
