### Themes
In configuration.yaml we can add support for UI Themes.  

Install [Home Assistant Community Store](../ADDONS/HACS.md) First 
```
frontend:
    themes: !include_dir_merge_named themes
```
Make a 'themes' folder in your /hassio/config folder. You can add themes there to use.  
Go to HACS in your sidebar.  
Go to Frontend  
Click the "+" button in the bottom right corner  
Search/Scroll to a theme you want, select it, scroll to the bottom, and install it  
Go to your actual user profile in the bottom left  
Select the new theme from the Theme dropdown menu  
