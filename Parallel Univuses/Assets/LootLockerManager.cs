using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using LootLocker.Requests;
using System.Text.RegularExpressions;

public class LootLockerManager : MonoBehaviour
{
    [Header ("UI")]
    public UnityEngine.UI.Text messageText;
    public UnityEngine.UI.InputField emailInput;
    public UnityEngine.UI.InputField passwordInput;
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

    // handler when user clicks the sign up button.
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
                Debug.Log("error while creating user");
                messageText.text = "Error while creating user";
                return;
            }
            Debug.Log("user created successfully");
            messageText.text = "User created successfully";
        });
    }

    public void LoginButton() {
        string email = emailInput.text;
        string password = passwordInput.text;
        bool rememberMe = true;
        LootLockerSDKManager.WhiteLabelLoginAndStartSession(email, password, rememberMe, response => {
            if (!response.success) {
                if (!response.LoginResponse.success) {
                    Debug.Log("error while logging in");
                } 
                else if (!response.SessionResponse.success) {
                    Debug.Log("error while starting session");
                }
                return;
            }
            messageText.text = "You are logged in";
            });
            
    }

    // public void ResetPasswordButton() {

    // }

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
