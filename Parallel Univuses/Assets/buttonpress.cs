using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class buttonpress : MonoBehaviour
{
    // // Start is called before the first frame update
    // void Start()
    // {
        
    // }

    // Update is called once per frame
    void Update()
    {
         //Detect when the Return key is pressed down
        if (Input.GetKeyDown(KeyCode.Return))
        {
            Debug.Log("Return key was pressed.");
        }

        //Detect when the Return key has been released
        if (Input.GetKeyUp(KeyCode.Return))
        {
            Debug.Log("Return key was released.");
        }
    }
}
