using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;


public class Options : MonoBehaviour
{
    [Header("Sliders")]
    [SerializeField] private Slider BGMSlider;
    [SerializeField] private Slider SFXSlider;
    [SerializeField] private Slider TextSpeedSlider;

    // Volume functionality
    public const string BGM_STATE = "bgmState";
    public const string SFX_STATE = "sfxState";
    public const string TEXT_SPEED_STATE = "textSpeedState";

    // Start is called before the first frame update
    void Start()
    {
        // for bgm settings
        if (PlayerPrefs.HasKey(BGM_STATE))
        {
            LoadBGM();
        }
        else 
        {   
            BGMSlider.value = 0.5f;
            SetBGM();
        }

        // for sfx settings 
        if (PlayerPrefs.HasKey(SFX_STATE))
        {
            LoadSFX();
        }
        else 
        {   
            SFXSlider.value = 0.25f;
            SetSFX();
        }

        // for text speed settings
        if (PlayerPrefs.HasKey(TEXT_SPEED_STATE))
        {
            LoadTextSpeed();
        }
        else 
        {   
            TextSpeedSlider.value = 20f;
            SetTextSpeed();
        }
    }

    public void SetBGM()
    {
        float bgm = BGMSlider.value;
        PlayerPrefs.SetFloat(BGM_STATE, bgm);
    }

    public void LoadBGM() 
    {
        BGMSlider.value = PlayerPrefs.GetFloat(BGM_STATE);
        SetBGM();
    }

    public void SetSFX()
    {
        float sfx = SFXSlider.value;
        Debug.Log("changed");
        PlayerPrefs.SetFloat(SFX_STATE, sfx);
    }

    public void LoadSFX() 
    {
        SFXSlider.value = PlayerPrefs.GetFloat(SFX_STATE);
        SetSFX();
    }

    public void SetTextSpeed()
    {
        float textSpeed = TextSpeedSlider.value;
        PlayerPrefs.SetFloat(TEXT_SPEED_STATE, textSpeed);
    }

    public void LoadTextSpeed() 
    {
        TextSpeedSlider.value = PlayerPrefs.GetFloat(TEXT_SPEED_STATE);
        SetTextSpeed();
    }
}