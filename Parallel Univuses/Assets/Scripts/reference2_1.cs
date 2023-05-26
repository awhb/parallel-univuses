using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Ink.Runtime;

public class reference2_1 : MonoBehaviour
{
	[SerializeField]
	private TextAsset inkAsset;
	private Story _inkStory;
	private bool storyNeeded;

	[SerializeField]
	private Canvas canvas;
	[SerializeField]
	private float elementPadding;

	/* UI Prefabs */
	[SerializeField]
	private UnityEngine.UI.Text text;
	[SerializeField]
	private UnityEngine.UI.Button button;


	void Awake () {
		_inkStory = new Story (inkAsset.text);
		storyNeeded = true;
	}

	// Update is called once per frame
	void Update () {
		if (storyNeeded == true) {
			RemoveChildren ();

			float offset = 0;
			while (_inkStory.canContinue) {
				UnityEngine.UI.Text storyText = Instantiate (text) as UnityEngine.UI.Text;
                Debug.Log(_inkStory.Continue());
				// UnityEngine.UI.Text storyText = Instantiate(text, new Vector2(0, 0), Quaternion.identity);
				storyText.text = _inkStory.Continue ();
				storyText.transform.SetParent (canvas.transform, false);
				storyText.transform.Translate (new Vector2 (0, offset));
				offset -= (storyText.fontSize + elementPadding);
			}

            // for the display text within the button choices
			if(_inkStory.currentChoices.Count > 0) {
				for (int ii = 0; ii < _inkStory.currentChoices.Count; ++ii) {
                    // creating the button
					UnityEngine.UI.Button choice = Instantiate (button) as UnityEngine.UI.Button;
					// UnityEngine.UI.Button choice = Instantiate(button, new Vector2(0, 0), Quaternion.identity);
					choice.transform.SetParent (canvas.transform, false);
					choice.transform.Translate (new Vector2 (0, offset));

					UnityEngine.UI.Text choiceText = choice.GetComponentInChildren<UnityEngine.UI.Text> ();
					choiceText.text = _inkStory.currentChoices [ii].text;

                    Debug.Log("Choice " + (ii + 1) + ". " + choiceText.text);

					UnityEngine.UI.HorizontalLayoutGroup layoutGroup = choice.GetComponent <UnityEngine.UI.HorizontalLayoutGroup> ();

					int choiceId = ii;
					choice.onClick.AddListener(delegate{ChoiceSelected(choiceId);}); 
					// choice.onClick.AddListener(ChoiceSelected(choiceId));
                    Debug.Log ("You have clicked the button!");

					// offset -= (choiceText.fontSize + layoutGroup.padding.top + layoutGroup.padding.bottom + elementPadding);
				}
			}

			storyNeeded = false;
		}
	}

	public void RemoveChildren () {
		int childCount = canvas.transform.childCount;
		for (int i = childCount - 1; i >= 0; --i) {
			GameObject.Destroy (canvas.transform.GetChild (i).gameObject);
		}
	}

	public void ChoiceSelected (int id) {
		_inkStory.ChooseChoiceIndex (id);
		storyNeeded = true;
	}
}
