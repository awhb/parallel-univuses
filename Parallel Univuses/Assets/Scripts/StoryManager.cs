using Ink.Runtime;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using LootLocker.Requests;
using System.Text.RegularExpressions;
using System.Text;
using System.Net;
using System.IO;
using UnityEngine.Networking;

public class StoryManager : MonoBehaviour
{
    [Header("Ink References")]
    [SerializeField] private TextAsset inkJSON;
    [SerializeField] private Story story;

    [Header("UI References")]
    [SerializeField] private UnityEngine.UI.Text textPrefab;
    [SerializeField] private UnityEngine.UI.Button buttonPrefab;

    // [SerializeField] private Sounds sounds;

    [Header("SFX References")]
    public AudioClip[] audioClipArray;
    [SerializeField] private AudioSource flexible;

    [Header("BGM References")]
    [SerializeField] private AudioSource bgm;

    // Save load functionality
    private const string SAVE_STORY_STATE = "savedStoryState";

    // Text typing effect functionality
    private float textSpeed = 20f;
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
        }
        else {
            flexible.volume = 0.25f;
            PlayerPrefs.SetFloat(Options.SFX_STATE, 0.25f);
        }

        // for text speed settings
        if (PlayerPrefs.HasKey(Options.TEXT_SPEED_STATE))
        {
            textSpeed = PlayerPrefs.GetFloat(Options.TEXT_SPEED_STATE);
        }
        else {
            textSpeed = 20f;
            PlayerPrefs.SetFloat(Options.TEXT_SPEED_STATE, 20f);
        }

        if (inkJSON != null)
        {
            story = new Story(inkJSON.text);
            story.ResetState();
            refreshUI();
        }

        CheckFileQuantity();
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

        // using tags in Ink to search for the index amongst an array of AudioClips. Play the clip associated with the number being tagged in Ink. 
        if (tags.Count > 0 && int.TryParse(tags[0], out int num) && tags.Count < audioClipArray.Length)
        {
            // Conversion successful, do something with num.
            flexible.clip = audioClipArray[num - 1];
            flexible.PlayOneShot(flexible.clip);
            flexible.Play();
        }
        else
        {
            flexible.clip = audioClipArray[0];
            flexible.PlayOneShot(flexible.clip);
            flexible.Play();
            // Conversion failed, handle the error.
            Debug.Log("The audio file you're looking for should be an integer or there are no tags");
        }

        // makes in-game region the parent of the story dialogue text
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
            // if left tab button is pressed, finish up displaying line right away
            /** 
                TBD: alternative check if player has set setting to skip typing effect
            */
            if (skipTypingEffect)
            {
            storyDialogue.text = line;
            break;
            }
            storyDialogue.text += letter;
            yield return new WaitForSeconds(1f / textSpeed);
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

    public void UploadFile() {
        string filePurpose = "Initial Progress Load";
        string fileNameOnServer = "Initialise.txt";
        bool isPublic = false;
        byte[] fileByteArray = Encoding.UTF8.GetBytes(story.state.ToJson());

        LootLockerSDKManager.UploadPlayerFile(fileByteArray, filePurpose, fileNameOnServer, isPublic, (response) => {
            // Save the file id in PlayerPrefs
            PlayerPrefs.SetInt("PlayerSaveDataFileID", response.id);
            Debug.Log("Initial story state uploaded");
        });
    }

    public void CheckFileQuantity() {
            // Get a list of the files that the current player has
            LootLockerSDKManager.GetAllPlayerFiles((response) =>
            {
                if (response.success)
                {
                    if (response.items.Length == 0) {
                        UploadFile();
                    }
                    else {
                        Debug.Log("There is already a saved file.");
                    }
                }
                else
                {
                    Debug.Log("Error in finding number of files present and whether to initialise upload");
                }
            });
    }

    /// <summary>
    /// Save the story state.
    /// </summary>
    public void SaveStoryState()
    {
        if (story != null) {
            int fileID = PlayerPrefs.GetInt("PlayerSaveDataFileID");
            byte[] fileByteArray = Encoding.UTF8.GetBytes(story.state.ToJson());

            LootLockerSDKManager.UpdatePlayerFile(fileID, fileByteArray, (response) => {
                if(response.success) {
                    Debug.Log("File was uploaded!");
                }
                else {
                    Debug.Log("File was not uploaded:" + response.Error);
                }
            });
        }
    }


    /// <summary>
    /// If we have saved data, load it.
    /// </summary>
    public void LoadStoryState()
    {
        int fileID = PlayerPrefs.GetInt("PlayerSaveDataFileID");
        LootLockerSDKManager.GetPlayerFile(fileID, (response) => {
            if (response.success) {
                Debug.Log("Retrieved URL");
                StartCoroutine(Download(response.url, (fileContent) => {
                    Debug.Log("File is downloaded");
                    story.state.LoadJson(fileContent);
                    refreshUI();
                }));
            }
            else {
                Debug.Log("Error bruv");
            }
        });

    }

    IEnumerator Download(string url, System.Action<string> fileContent) {
        UnityWebRequest www = new UnityWebRequest(url);
        www.downloadHandler = new DownloadHandlerBuffer();
        yield return www.SendWebRequest();

        if (www.result != UnityWebRequest.Result.Success)
        {
            Debug.Log(www.error);
        }
        else
        { 
            fileContent(www.downloadHandler.text);
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
