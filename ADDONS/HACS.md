# Home Assistant Community Store
Let's you get user content things like themes and stuff.  

On your server run `curl -sfSL https://hacs.xyz/install | bash -`  
  You might need to use sudo `curl -sfSL https://hacs.xyz/install | sudo bash -`  
Then reboot Home Assistant  

Create/Sign into a GitHub Account: https://github.com/  
Go to: https://github.com/settings/tokens  
Click the "Generate new token" button.  
First give it a logical name so that you can recognize it. Example: HACS  
You do not need to check any of the boxes.  
Then click the "Generate token" button at the bottom.  
Now you see the generated token, this will be the only time you see it, make sure that you copy it manually or by clicking the clipboard icon.  

Go back to Home Assistant > Configuration > Integrations  
Click the "+" button in the bottom right corner  
Search for or scroll down to find "HACS (Home Assistant Community Store)" and select it  
Wait for a pop-up  
Paste your GitHub Personal Access Token  
Click submit and wait for confirmation  
