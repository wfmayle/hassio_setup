# Duck DNS

Go to Settings > Add-ons > Add-On Store  
Search for 'DuckDNS' and install it  

Visit [DuckDNS.org](https://www.DuckDNS.org)  
Create an account by logging in through any of the available account services (Google, Github, Twitter, Persona).  
In the Domains section, type the name of the subdomain you wish to register and click add domain.  
>themayles  

Copy the DuckDNS token and the full domain name.  
>token: XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX  
>domain: themayles.duckdns.org  

In the DuckDNS add-on configuration, perform the following:  
Update the domains option with the full domain name you registered.  
Update the token option with the token that was generated.  
Update the `lets-encrypt.accept_terms` option to `true`  

You should end up with something like this:  
```
aliases: []
domains:
  - themayles.duckdns.org
lets_encrypt:
  accept_terms: true
  algo: secp384r1
  certfile: fullchain.pem
  keyfile: privkey.pem
seconds: 300
token: XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
```  


Additionally, you'll need to configure the Home Assistant Core to pick up the SSL certificates. This is done by setting the following configuration for the HTTP integration configuration in your `configuration.yaml`:  
```
http:
  ssl_certificate: /ssl/fullchain.pem
  ssl_key: /ssl/privkey.pem
  ip_ban_enabled: true
  login_attempts_threshold: 5
```
After that is saved, reboot or restart Home Assistant.  