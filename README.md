# hassio_setup
Scripts and documentation for setting up my Home Assistant computer and configuration.  
## Hardware
I'm using an Intel NUC to run my Home Assistant server. Something like a Raspberry Pi should work fine for most cases, but I need a bit more power to transcode audio/video for Plex.  

## Operating System
Since a lot of people run this on a Pi, this document is going to assume you are using some form of Linux like Raspbian or Ubuntu.  

## Static IP & Reserved IP
Go reserve a static ip address on router and/or set it on the linux pc.  
```
192.168.1.X
255.255.0.0
192.168.0.1
8.8.4.4, 8.8.8.8
```

## Home Assistant
The install method I use will be deprecated soon.  
https://www.home-assistant.io/blog/2020/05/09/deprecating-home-assistant-supervised-on-generic-linux/  
But just edit the first couple lines and run the install.sh  
Once it finishes, keep checking `YOUR_IP_ADDRESS:8123` until it loads  
Make a User  
Set Location/Timezone  

## Things to Install
[Home Assistant Community Store](ADDONS/HACS.md)  
[Duck DNS](ADDONS/DUCKDNS.md)  
[Vaultwarden](ADDONS/VAULTWARDEN.md)  
[File Editor](ADDONS/FILE_EDITOR.md)  
[Plex Media Server](ADDONS/PLEX.md)  
[Tautulli](ADDONS/TAUTULLI.md)  
[Samba Share](ADDONS/SAMBA.md)    
[FTP](ADDONS/FTP.md)  
[Nanoleaf](ADDONS/NANOLEAF.md)  
[Flic](ADDONS/FLIC.md)  

## Neat Configuration Things 
[Secrets](CONFIG/SECRETS.md)  
[Themes](CONFIG/THEMES.md)  
[System Monitor - Drive Storage](CONFIG/DISPLAY_DRIVE_STORAGE.md)  
