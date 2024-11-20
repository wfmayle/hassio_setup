# GO2RTC

Go to Settings > Add-ons > Add-On Store  
Add a repository: https://github.com/AlexxIT/hassio-addons  
Refresh the page  
Search for 'go2rtc' and install it  
Start the Add-on  
Open the Web UI  
Go to the "Add" Tab  
In our case, Tapo cameras will show up under the ONVIF heading, so click that  
It should populate some cameras that were found, if not, click ONVIF again  
Copy the stream info, it should look like:  
  `onvif://user:pass@192.168.3.171:2020`  
Edit the `user:pass` with your camera info  
Paste the edited stream info into the "Test" box above  
Click the Test button  
It should return results that look similar, for example:  
  `onvif://user:pass@192.168.3.171:2020?subtype=profile_1`  
  `onvif://user:pass@192.168.3.171:2020?subtype=profile_2`  
Go up to the "Config" Tab  
Add your information to it like so:  
```
streams:
  camera.yourcam-hd:
    - onvif://user:pass@192.168.3.171:2020?subtype=profile_1
  camera.yourcam-sd:
    - onvif://user:pass@192.168.3.171:2020?subtype=profile_2
```
Click "Save & Restart" button in the upper left  
Go back up to the "Streams" Tab  
You should see your cameras listed there  
Click on the `stream` text to test out the camera stream  

