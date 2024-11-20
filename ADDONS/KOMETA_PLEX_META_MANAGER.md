# PLEX META MANAGER


## Install
Install [Plex Media Server](PLEX.md) First  

Go to Settings > Add-ons > Add-On Store  
Add a repository: https://github.com/alexbelgium/hassio-addons  
Search for 'plex media manager' and install it  

Update the add-on config yaml  

```
PGID: 1000
PMM_CONFIG: /config/addons_config/plex-data-manager/config.yml
PUID: 1000
```

Edit the file to configure PMM at `/homeassistant/addons_config/plex-data-manager/config.yml`  
