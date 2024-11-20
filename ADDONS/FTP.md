# FTP
If you want to share your media files directly with someone over the internet, you can use FTP to transfer them.  

I'm using [Secrets](../CONFIG/SECRETS.md) for my credentials

Go to Settings > Add-ons > Add-On Store  
Search for 'FTP' and install it  
Update the add-on config  
```
banner: Welcome to the Hass.io FTP service.
certfile: fullchain.pem
data_port: 20
implicit_ssl: false
keyfile: privkey.pem
max_clients: 5
pasv: true
pasv_address: themayles.duckdns.org
pasv_max_port: 30010
pasv_min_port: 30000
port: 21
ssl: true
users:
  - addons: false
    allow_chmod: false
    allow_dirlist: true
    allow_download: true
    allow_upload: false
    backup: false
    config: false
    media: false
    password: datahoarder
    share: true
    ssl: false
    username: kevin
pasv_addr_resolve: true
```
Make sure to open the port(s) listed over in [Firewalla](../FIREWALLA.md)
