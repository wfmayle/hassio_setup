# Plex Media Server

## Install  
Go to Settings > Add-ons > Add-On Store  
Search for 'Plex Media Server' and install it  
Turn on auto update  
Navigate to https://www.plex.tv/claim and get your claim token.  

Update the add-on config with the claim code you've got in the previous step.  
```
claim_code: claim-asdfasdfasdfasdf  
webtools: true  
log_level: info  
```
Save the add-on configuration.  
Start the "Plex Media Server" add-on.  
Check the logs of the "Plex Media Server" to see if everything went well.  

Login to the Plex admin interface and complete the setup process.  
http://YOUR_IP_ADDRESS:32400/web  

Go to Settings  
Enable Remote  

## Media  
OPTIONAL: If you are using external drives for media storage, they need to be mounted to the hassio share directory.  

For each external drive, change your external drive mountpoint to '/usr/share/hassio/share/YOUR_DRIVE_NAME'  
Reboot afterwards  
Get the device ids with `sudo fdisk -l` or `sudo ls -l /dev/disk/by-id/`  

For each devce id, add them to fstab  
`sudo nano /etc/fstab`  

/dev/disk/by-id/YOUR_DEVICE_ID /usr/share/hassio/share/YOUR_DRIVE_NAME auto nosuid,nodev,nofail,x-gvfs-show 0 0  

OPTIONAL: If you need to migrate Plex Data from an existing server, it needs to go here: '/usr/share/hassio/addons/data/a0d7b954_plex'  
I probably did things wrong, but I had to use `sudo` to have the rights to move things there.  

`sudo mv "PATH/TO/YOUR/DATA/Plex Media Server" "/usr/share/hassio/addons/data/a0d7b954_plex"`  

`sudo chown root:root "/usr/share/hassio/addons/data/a0d7b954_plex/Plex Media Server"`  

## PFX Generation
With the default SSL setup from [Duck DNS](DUCKDNS.md)  
Open a terminal or an SSH connection  
Run this command  
`sudo openssl pkcs12 -inkey /usr/share/hassio/ssl/privkey.pem -in /usr/share/hassio/ssl/fullchain.pem -export -out /usr/share/hassio/ssl/plex.pfx`  
Hit "Enter" twice for no password  

## Plex Server Configuration
Settings > General > Friendly Name  
`Plexbot`  
Settings > Network > Custom Certificate Location  
`/ssl/plex.pfx`  
Settings > Network > Custom Certificate Domain  
`https://themayles.duckdns.org:32400`  