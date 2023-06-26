using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class MainMenu : MonoBehaviour
{

    /// <summary>
    /// Enter the game.
    /// </summary>
    public void PlayGame() {
        SceneManager.LoadScene(1);
    }
}
