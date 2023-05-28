using Ink.Runtime;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Working1copy : MonoBehaviour
{
    [SerializeField]
    private TextAsset inkJSON;
    private Story story;

    [SerializeField]
    private UnityEngine.UI.Text textPrefab;
    [SerializeField]
    private UnityEngine.UI.Button buttonPrefab;
    
    // Start is called before the first frame update
    void Start()
    {
        story = new Story(inkJSON.text);

        refreshUI();
    }

    /// <summary>
    /// Runs the resetting of new narration and choice text after a previous choice is made. 
    /// </summary>
    void refreshUI()
    {
        eraseUI();

         UnityEngine.UI.Text storyDialogue = Instantiate(textPrefab) as UnityEngine.UI.Text;

         string loadedText = loadStoryChunk();

         List<string> tags = story.currentTags;

         if (tags.Count > 0)
         {
            loadedText = "<b>" + tags[0] + "</b> - " + loadedText;
         }

        storyDialogue.text = loadedText;
        storyDialogue.transform.SetParent(this.transform, false); 

        for (int i = 0; i < story.currentChoices.Count; i++)
        {
            UnityEngine.UI.Button choiceButton = Instantiate(buttonPrefab) as UnityEngine.UI.Button;
            UnityEngine.UI.Text choiceButtonText = choiceButton.GetComponentInChildren<UnityEngine.UI.Text>();
            
            Choice choice = story.currentChoices[i];
            choiceButtonText.text = choice.text;

            choiceButton.transform.SetParent(this.transform, false);

            choiceButton.onClick.AddListener(delegate
            {
                chooseStoryChoice(choice);
            });
        }
    }

    /// <summary>
    /// Remove all game objects to prepare for next story chunk to be updated.
    /// </summary>
    void eraseUI()
    {
        for(int i = 0; i < this.transform.childCount; i++)
        {
            Destroy(this.transform.GetChild(i).gameObject);
        }
    }

    /// <summary>
    /// Trigger to move to the next set of choices.
    /// </summary>
    /// <param name="choice">The type that a choice is represented by</param>
    void chooseStoryChoice(Choice choice)
    {
        story.ChooseChoiceIndex(choice.index);
        refreshUI();
    }

    /// <summary>
    /// Output text narration above choice buttons.
    /// </summary>
    /// <returns>
    /// A string representing the fully loaded story read within the JSON file until a set of choices has to be made.
    /// </returns>
    string loadStoryChunk()
    {
        string textChunk = "";
        
        if (story.canContinue)
        {
            textChunk = story.ContinueMaximally();
        }
        return textChunk;
    }

    // // Update is called once per frame
    // void Update()
    // {
        
    // }
}
