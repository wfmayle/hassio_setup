# Samba Share
If you want to move media over from another computer, or just access your files a bit easier, Samba Share will help with that.  

I'm using [Secrets](../CONFIG/SECRETS.md) for my credentials

Go to Settings > Add-ons > Add-On Store  
Search for 'Samba share' and install it  
Turn on auto update  
Update the add-on config  
```
allow_hosts:
  - 10.0.0.0/8
  - 172.16.0.0/12
  - 192.168.0.0/16
compatibility_mode: false
password: '!secret linux_pass'
username: '!secret linux_user'
veto_files:
  - ._*
  - .DS_Store
  - Thumbs.db
  - icon?
  - .Trashes
  - $RECYCLE.BIN
  - System Volume Information
workgroup: WORKGROUP
interface: ''
```
On your Windows PC, open My Computer/This PC  
Right-click anywhere  
Add a network location  
Next  
Next  
\\\YOUR_IP_ADDRESS\Share  
Enter your username/password defined in your config  

