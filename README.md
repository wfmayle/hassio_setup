# hassio_setup
Scripts and documentation for setting up my Home Assistant computer and configuration.



## Hardware
I'm using an Intel NUC to run my Home Assistant server. Something like a Raspberry Pi should work fine for most cases, but I need a bit more power to transcode audio/video for Plex.

## Operating System
Since a lot of people run this on a Pi, this document is going to assume you are using some form of Linux like Raspbian or Ubuntu.

## Static IP & Reserved IP
Go reserve a static ip address on router and/or set it on the linux pc.
    192.168.1.X
    255.255.0.0
    192.168.0.1
    8.8.4.4, 8.8.8.8

## Home Assistant
The install method I use will be deprecated soon.
https://www.home-assistant.io/blog/2020/05/09/deprecating-home-assistant-supervised-on-generic-linux/

But just edit the first couple lines and run the install.sh

Once it finishes, keep checking `YOUR_IP_ADDRESS:8123` until it loads
Make a User
Set Location/Timezone

## Things to Install

### File Editor
This makes using hass a million times easier. You can directly edit your configuration from within Home Assistant instead of trying to find the files through the Operating System. This means you can also do it from a networked computer.

Go to Supervisor > Add-On Store
Search for 'File editor' and install it
Start the add-on
Turn on auto update
Add it to the sidebar


### Plex Media Server

Go to Supervisor > Add-On Store
Search for 'Plex Media Server' and install it
Turn on auto update
Navigate to https://www.plex.tv/claim and get your claim token.

Update the add-on config with the claim code you've got in the previous step.
    claim_code: claim-asdfasdfasdfasdf
    webtools: true
    log_level: info

Save the add-on configuration.
Start the "Plex Media Server" add-on.
Check the logs of the "Plex Media Server" to see if everything went well.

Login to the Plex admin interface and complete the setup process.
http://YOUR_IP_ADDRESS:32400/web

Go to Settings
Change the port to 32402
Enable Remote

OPTIONAL: If you are using external drives for media storage, they need to be mounted to the hassio share directory.
For each external drive, change your external drive mountpoint to '/usr/share/hassio/share/YOUR_DRIVE_NAME' 
Reboot afterwards
Get the device ids with `sudo fdisk -l` or `sudo ls -l /dev/disk/by-id/`
For each devce id, add them to fstab
sudo nano /etc/fstab
/dev/disk/by-id/YOUR_DEVICE_ID /usr/share/hassio/share/YOUR_DRIVE_NAME auto nosuid,nodev,nofail,x-gvfs-show 0 0

OPTIONAL: If you need to migrate Plex Data from an existing server, it needs to go here: '/usr/share/hassio/addons/data/a0d7b954_plex'
I probably did things wrong, but I had to use `sudo` to have the rights to move things there.
`sudo mv "PATH/TO/YOUR/DATA/Plex Media Server" "/usr/share/hassio/addons/data/a0d7b954_plex"`
`sudo chown root:root "/usr/share/hassio/addons/data/a0d7b954_plex/Plex Media Server"`


### Tautulli
Go to Supervisor > Add-On Store
Search for 'Tautulli' and install it
Turn on auto update
Update the add-on config 
    username: MakeAUser
    password: MakeAPassword
    ssl: false
    certfile: fullchain.pem
    keyfile: privkey.pem
Start the add-on
Login to the Tautulli admin interface and complete the setup process.


### Samba Share
If you want to move media over from another computer, or just access your files a bit easier, Samba Sahre will help with that.

Go to Supervisor > Add-On Store
Search for 'Samba share' and install it
Turn on auto update
Update the add-on config 

workgroup: WORKGROUP
username: '!secret linux_user' # I store my username in a separate file
password: '!secret linux_pass' # I store my password in a separate file
interface: ''
allow_hosts:
  - 10.0.0.0/8
  - 172.16.0.0/12
  - 192.168.0.0/16
veto_files:
  - ._*
  - .DS_Store
  - Thumbs.db
  - icon?
  - .Trashes
  - $RECYCLE.BIN
  - System Volume Information
compatibility_mode: false

On your Windows PC, open My Computer/This PC
Right-click anywhere
Add a network location
Next
Next
\\YOUR_IP_ADDRESS\Share
Enter your username/password defined in your config


### Nanoleaf
Connect your Nanoleaf lights to Home Assistant.

Connect them to your network with your phone.
Go to your router and find their IP.
Might not be named, but MAC should start with 00:55:DA
Reserve that IP so it's always the same.
Put them in pairing mode. It lasts 30 seconds
Open a terminal and run `curl -i -X POST http://192.168.1.5:16021/api/v1/new` while it's pairing.
Copy the TOKEN somewhere.
Add a light to your configuration.yaml

light:
  - platform: nanoleaf
    host: 192.168.3.50
    token: TOKEN

### FLIC
Go to Supervisor > Add-On Store
Add a repository: https://github.com/pschmitt/home-assistant-addons
Search for 'flicd' and install it

Edit the configuration.yaml

device_tracker:
  - platform: bluetooth_le_tracker

binary_sensor:
  - platform: flic
    discovery: true
    host: localhost
    port: 5551

Start the service
Press and hold flic for ~7 seconds. There will be a quick flash of the led if it pairs.
You may need to restart Home Assistant to pair an additional button.



## Neat Config Things

### System Monitor - Drive Storage
In configuration.yaml we can add our external drives to monitor the remaining storage. Just make a UI card that points to these.

sensor:
  - platform: systemmonitor
    resources:
      - type: disk_free
        arg: /share/Anime1
      - type: disk_free
        arg: /share/Anime2-Cartoons-Music
      - type: disk_free
        arg: /share/Movies1
      - type: disk_free
        arg: /share/Movies2
      - type: disk_free
        arg: /share/Movies3-TV2-Pictures
      - type: disk_free
        arg: /share/TV1

### Home Assistant Community Store
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

Go back to Home Assistant > Configuration > Inegrations
Click the "+" button in the bottom right corner
Search for or scroll down to find "HACS (Home Assistant Community Store)" and select it
Wait for a pop-up
Paste your GitHub Personal Access Token
Click submit and wait for confirmation.

### Themes
In configuration.yaml we can add support for UI Themes.

Make sure to install HACS above.

frontend:
    themes: !include_dir_merge_named themes

Make a 'themes' folder in your /hassio/config folder. You can add themes there to use.
Go to HACS in your sidebar.
Go to Frontend
Click the "+" button in the bottom right corner
Search/Scroll to a theme you want, select it, scroll to the bottom, and install it
Go to your actual user profile in the bottom left
Select the new theme from the Theme dropdown menu

### Secrets
In your /hassio/config folder, you can make a 'secrets.yaml' file and store your usernames, passwords, ssh keys and more. That way, you can share your configurations without having to worry about sharing sensitive information.

linux_user: cooluser
linux_pass: coolpass
