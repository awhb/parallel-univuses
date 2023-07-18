using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;


public class ChangeInput : MonoBehaviour
{
    EventSystem system;
    public Selectable firstInput;
    public Button submitButton;

    // Start is called before the first frame update
    void Start() {
        system = EventSystem.current;
        firstInput.Select();
    }

    // Update is called once per frame
    void Update() {
        if (Input.GetKeyDown(KeyCode.Tab)) {
            if (system.currentSelectedGameObject != null) {
                Selectable next = system.currentSelectedGameObject.GetComponent<Selectable>().FindSelectableOnDown();
                if (next != null) {
                    next.Select();
                }
            }
            else {
                // Handle the case when there is no currently selected GameObject
                firstInput.Select();
            }
        }
        else if (Input.GetKeyDown(KeyCode.Return)) {
            submitButton.onClick.Invoke();
            Debug.Log("Enter button pressed, login triggered.");
        }
    }
}
