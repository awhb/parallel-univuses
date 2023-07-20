using Ink.Runtime;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class StoryManager : MonoBehaviour
{
    [Header("Params")]
    [SerializeField] private float textSpeed = 0.04f;

    [Header("Ink References")]
    [SerializeField] private TextAsset inkJSON;
    [SerializeField] private Story story;

    [Header("UI References")]
    [SerializeField] private UnityEngine.UI.Text textPrefab;
    [SerializeField] private UnityEngine.UI.Button buttonPrefab;

    // [SerializeField] private Sounds sounds;

    [Header("SFX References")]
    [SerializeField] private AudioSource clicksoundeffect;
    public AudioClip[] audioClipArray;
    [SerializeField] private AudioSource flexible;

    [Header("BGM References")]
    [SerializeField] private AudioSource bgm;

    // Save load functionality
    private const string SAVE_STORY_STATE = "savedStoryState";

    // Text typing effect functionality
    private bool skipTypingEffect = false;
    
    // Start is called before the first frame update
    void Start()
    {
        // for audio files
        flexible = gameObject.GetComponent<AudioSource> ();

        // for bgm settings
        if (PlayerPrefs.HasKey(Options.BGM_STATE))
        {
            bgm.volume = PlayerPrefs.GetFloat(Options.BGM_STATE);
        }
        else {
            bgm.volume = 0.5f;
            PlayerPrefs.SetFloat(Options.BGM_STATE, 0.5f);
        }

        // for sfx settings
        if (PlayerPrefs.HasKey(Options.SFX_STATE))
        {
            flexible.volume = PlayerPrefs.GetFloat(Options.SFX_STATE);
            clicksoundeffect.volume = PlayerPrefs.GetFloat(Options.SFX_STATE);
        }
        else {
            flexible.volume = 0.5f;
            clicksoundeffect.volume = 0.5f;
            PlayerPrefs.SetFloat(Options.SFX_STATE, 0.5f);
        }

        story = new Story(inkJSON.text);
        story.ResetState();
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

        // makes in-game region the parent of the story dialogue text
        storyDialogue.transform.SetParent(this.transform, false); 
        StartCoroutine(DisplayLine(storyDialogue, loadedText, showChoicesAfter));

        List<string> tags = story.currentTags;

        // using tags in Ink to search for the index amongst an array of AudioClips. Play the clip associated with the number being tagged in Ink. 
        if (tags.Count > 0 && int.TryParse(tags[0], out int num) && tags.Count < audioClipArray.Length)
        {
            // Conversion successful, do something with num.
        flexible.clip = audioClipArray[num - 1];
        flexible.PlayOneShot (flexible.clip);
        flexible.Play();
        }
        else
        {
            // Conversion failed, handle the error.
            Debug.Log("The audio file you're looking for should be an integer or there are no tags");
        }

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
            if (skipTypingEffect)
            {
            storyDialogue.text = line;
            break;
            }
            storyDialogue.text += letter;
            yield return new WaitForSeconds(textSpeed);
        }

        skipTypingEffect = false;

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
                clicksoundeffect.Play();
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


    /// <summary>
    /// Save the story state.
    /// </summary>
    public void SaveStoryState()
    {
        if (story != null)
        {
            PlayerPrefs.SetString(SAVE_STORY_STATE, story.state.ToJson());
            Debug.Log("Saved story state");
        }
    }


    /// <summary>
    /// If we have saved data, load it.
    /// </summary>
    public void LoadStoryState()
    {
        if (PlayerPrefs.HasKey(SAVE_STORY_STATE))
        {
            story.state.LoadJson(PlayerPrefs.GetString(SAVE_STORY_STATE));
            Debug.Log("Loaded story state");
            refreshUI();
        }
    }

    /// <summary>
    /// Return to the main menu.
    /// </summary>
    public void ReturnMainMenu() {
        SaveStoryState();
        SceneManager.LoadScene("Main Menu");
    }

    private void Update()
    {
    if (Input.GetKeyDown(KeyCode.Tab))
    {
        skipTypingEffect = true;
    }
    }
}
