using Ink.Runtime;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Working1 : MonoBehaviour
{
    [Header("Params")]
    [SerializeField] private float textSpeed = 0.04f;

    [Header("Ink References")]
    [SerializeField] private TextAsset inkJSON;
    [SerializeField] private Story story;

    [Header("UI References")]
    [SerializeField] private UnityEngine.UI.Text textPrefab;
    [SerializeField] private UnityEngine.UI.Button buttonPrefab;
    
    // Start is called before the first frame update
    void Start()
    {
        story = new Story(inkJSON.text);

        refreshUI();
    }

    /// <summary>
    /// Runs the resetting of new narration and choice text after a previous choice is made. 
    /// </summary>
    private void refreshUI()
    {
        eraseUI();

         UnityEngine.UI.Text storyDialogue = Instantiate(textPrefab) as UnityEngine.UI.Text;

         string loadedText = loadStoryChunk();

         List<string> tags = story.currentTags;

         if (tags.Count > 0)
         {
            loadedText = "<b>" + tags[0] + "</b> - " + loadedText;
         }

        // makes canvas the parent of the story dialogue text
        storyDialogue.transform.SetParent(this.transform, false); 
        StartCoroutine(DisplayLine(storyDialogue, loadedText, showChoicesAfter));

    }

    /// <summary>
    /// Remove all game objects to prepare for next story chunk to be updated.
    /// </summary>
    private void eraseUI()
    {
        for(int i = 0; i < this.transform.childCount; i++)
        {
            Destroy(this.transform.GetChild(i).gameObject);
        }
    }

    //// <summary>
    /// Display each letter in the line in story dialogue one at a time.
    private IEnumerator DisplayLine(UnityEngine.UI.Text storyDialogue, string line, System.Action showChoicesAfter) {
        // empty the dialogue text
        storyDialogue.text = "";

        // display each letter one at a time
        foreach (char letter in line.ToCharArray()) {
            // if submit button is pressed, finish up displaying line right away
            /** 
                TBD: alternative check if player has set setting to skip typing effect
            */
            if (Input.GetKeyDown(KeyCode.Return)) {
                storyDialogue.text = line;
                break;
            }
            storyDialogue.text += letter;
            yield return new WaitForSeconds(textSpeed);
        }

        // display choices after the line is fully displayed
        showChoicesAfter();
    }

    private void showChoicesAfter() {
        for (int i = 0; i < story.currentChoices.Count; i++) {
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
    /// Trigger to move to the next set of choices.
    /// </summary>
    /// <param name="choice">The type that a choice is represented by</param>
    private void chooseStoryChoice(Choice choice)
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
    private string loadStoryChunk()
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
