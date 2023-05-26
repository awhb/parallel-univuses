 using Ink.Runtime;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Working1 : MonoBehaviour
{
    public TextAsset inkJSON;
    private Story story;

    public UnityEngine.UI.Text textPrefab;
    public UnityEngine.UI.Button buttonPrefab;
    
    // Start is called before the first frame update
    void Start()
    {
        story = new Story(inkJSON.text);

        refreshUI();
    }

    void refreshUI()
    {
        eraseUI();

         UnityEngine.UI.Text storyText = Instantiate(textPrefab) as UnityEngine.UI.Text;

         string text = loadStoryChunk();

         List<string> tags = story.currentTags;

         if (tags.Count > 0)
         {
            text = "<b>" + tags[0] + "</b> - " + text;
         }

        storyText.text = text;
        storyText.transform.SetParent(this.transform, false); 

        foreach (Choice choice in story.currentChoices)
        {
            UnityEngine.UI.Button choiceButton = Instantiate(buttonPrefab) as UnityEngine.UI.Button;
            UnityEngine.UI.Text choiceText = buttonPrefab.GetComponentInChildren<UnityEngine.UI.Text>();
            choiceText.text = choice.text;
            choiceButton.transform.SetParent(this.transform, false);

            choiceButton.onClick.AddListener(delegate
            {
                chooseStoryChoice(choice);
            });
        }
    }

    void eraseUI()
    {
        for(int i = 0; i < this.transform.childCount; i++)
        {
            Destroy(this.transform.GetChild(i).gameObject);
        }
    }

    void chooseStoryChoice(Choice choice)
    {
        story.ChooseChoiceIndex(choice.index);
        refreshUI();
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    string loadStoryChunk()
    {
        string text = "";
        
        if (story.canContinue)
        {
            text = story.ContinueMaximally();
        }
        return text;
    }
}
