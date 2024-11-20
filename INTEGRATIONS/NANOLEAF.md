# Nanoleaf
Connect your Nanoleaf lights to Home Assistant.  

Connect them to your network with your phone.  
Go to your router and find their IP.  
Might not be named, but MAC should start with 00:55:DA  
Reserve that IP so it's always the same.  
Put them in pairing mode. It lasts 30 seconds  
Open a terminal and run `curl -i -X POST http://192.168.1.5:16021/api/v1/new` while it's pairing.  
Copy the TOKEN somewhere.  
Add a light to your configuration.yaml  

```
light:  
    - platform: nanoleaf  
    - host: 192.168.3.50  
    - token: TOKEN  
```