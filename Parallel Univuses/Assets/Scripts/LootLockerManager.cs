using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using LootLocker.Requests;
using System.Text.RegularExpressions;
using UnityEngine.SceneManagement;

public class LootLockerManager : MonoBehaviour
{
    [Header ("UI")]
    public UnityEngine.UI.Text messageText;
    public UnityEngine.UI.InputField emailInput;
    public UnityEngine.UI.InputField passwordInput;
    public UnityEngine.UI.Button startButton;
    public const string matchEmailPattern =
		@"^(([\w-]+\.)+[\w-]+|([a-zA-Z]{1}|[\w-]{2,}))@"
		+ @"((([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])\.([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])\."
		+ @"([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])\.([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])){1}|"
		+ @"([a-zA-Z]+[\w-]+\.)+[a-zA-Z]{2,4})$";

    public static bool ValidateEmail (string email) {
		if (email != null)
			return Regex.IsMatch (email, matchEmailPattern);
		else
			return false;
	}

    // handler when user clicks the register button.
    public void RegisterButton() {
        string email = emailInput.text;
        string password = passwordInput.text;

        if (!ValidateEmail(email) || email == "") {
            messageText.text = "Your email is invalid";
            return;
        }

        if (password.Length < 8 || password == "") {
            messageText.text = "Your password must be at least 8 characters long";
            return;
        }

        LootLockerSDKManager.WhiteLabelSignUp(email, password, (response) => {

            if (!response.success) {
                Debug.Log("You have already created an account. Please check if you have verified your email");
                messageText.text = "You have already created an account. Please check if you have verified your email";
                return;
            }
            Debug.Log("user created successfully");
            messageText.text = "We're almost done! Please go to your email to verify your address";
        });
    }

    public void LoginButton() {
        string email = emailInput.text;
        string password = passwordInput.text;
        bool rememberMe = true;

        if (!ValidateEmail(email) || email == "") {
            messageText.text = "Your email is invalid";
            return;
        }

        if (password.Length < 8 || password == "") {
            messageText.text = "Your password must be at least 8 characters long";
            return;
        }

        LootLockerSDKManager.WhiteLabelLoginAndStartSession(email, password, rememberMe, response => {
            if (!response.success) {
                if (!response.LoginResponse.success) {
                    Debug.Log("Error while logging in, check your email and password");
                    messageText.text = "Error while logging in, check your email and password";
                } 
                else if (!response.SessionResponse.success) {
                    Debug.Log("Error while starting session");
                    messageText.text = "Error while starting session, please try again";
                }
                return;
            }
            messageText.text = "You are logged in";
            // reveal start game button after successful login
            startButton.gameObject.SetActive(true);
            });
            
    }

    public void ResetPasswordButton() {
        string email = emailInput.text;

        if (!ValidateEmail(email) || email == "") {
            messageText.text = "Please enter your correct email to reset";
            return;
        }

        LootLockerSDKManager.WhiteLabelRequestPassword(email, (response) => {
            if (!response.success) {
                Debug.Log("Error requesting password reset");
                messageText.text = "Error requesting password reset";
                return;
            }
            Debug.Log("Email to reset password successfully sent");
            messageText.text = "Email to reset password successfully sent";
        });
    }

    /// <summary>
    /// Method used by Start Button to initiate scene change to Main Menu
    /// </summary>
    public void EnterMainMenu() {
        SceneManager.LoadScene("Main Menu");
    }

    // Start is called before the first frame update
    void Start()
    {
        // Make Start Button invisible until login is successful
        startButton.gameObject.SetActive(false);
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
