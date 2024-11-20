# LIDARR
Go to Settings > Add-ons > Add-On Store  
Add a repository: https://github.com/alexbelgium/hassio-addons  
Search for 'lidarr' and install it  

Update the add-on config  
I'm using [Secrets](../CONFIG/SECRETS.md) for my credentials  
I'm using [Samba](../ADDONS/SAMBA.md) for my network drives  

```
PGID: 0
PUID: 0
TZ: EST
networkdisks: //192.168.1.99/share
cifspassword: "!secret linux_pass"
cifsusername: "!secret linux_user"
```

Make sure to open the port `8686` listed over in [Firewalla](../FIREWALLA.md)  


Go to your Web UI https://themayles.duckdns.org:8686  
Go to Settings > Media Management > Add Root Folder  
Enter a Name: FLAC  
Enter a Path: /share/Anime2-Cartoons-Music/Music-FLAC/  
Monitor: Missing Albums  
Monitor New Albums: All Albums  
Quality Profile: Lossless  
Metadata Profile: Standard  
Default Lidarr Tags:  

Save, and let it scan in your existing music.