# Local Tuya 

## Pair Devices
Download the Tuya App 
Create a Tuya Account
Pair all of your devices to the 2G network  
Restart WiFi Router if you have issues  
Rename them appropriately  

## IoT Account
Create an account at https://us.iot.tuya.com/
Not the same as your Tuya App account, but you can make them match
Create a new Cloud Project
Authorize Authentication API stuff
Pair your Tuya App to the Website to load in the devices
Go to Cloud > API Explorer
Go to General Devices Management > Get Device Information

## Install
Install [Home Assistant Community Store](HACS.md) First 
Go to HACS in your sidebar.  
Go to Integrations  
Search for Local Tuya  
Install the Integration  
Restart HA  
From Home Assistant, go to Configuration > Devices and Services
If you have the cloud version of Tuya already enabled, disable it for now.
Click the "+" button in the bottom right corner  
Add the Integration "LocalTuya"
If it doesn't appear, clear your browser cache and refresh.



## Resources
https://www.reddit.com/r/homeassistant/comments/oglpgc/absolute_beginners_guide_to_setting_up_local_tuya/

https://community.home-assistant.io/t/local-tuya-integration/351546

