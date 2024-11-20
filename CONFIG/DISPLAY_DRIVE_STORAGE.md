### System Monitor - Drive Storage
In configuration.yaml we can add our external drives to monitor the remaining storage. Just make a UI card that points to these.  

```sensor:
  - platform: systemmonitor
    resources:
      - type: disk_free
        arg: /share/Anime1
      - type: disk_free
        arg: /share/Anime2
      - type: disk_free
        arg: /share/Anime3
      - type: disk_free
        arg: /share/Pictures
      - type: disk_free
        arg: /share/Anime2-Cartoons-Music
      - type: disk_free
        arg: /share/TV1
      - type: disk_free
        arg: /share/Movies-TV2-Pictures
```
