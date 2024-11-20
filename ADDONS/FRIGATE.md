# FRIGATE

## Install
Install [MOSQUITTO](MOSQUITTO.md) First  

Go to Settings > Add-ons > Add-On Store  
Add a repository: https://github.com/blakeblackshear/frigate-hass-addons  
Refresh the page  
Search for 'go2rtc' and install it  
Start the Add-on  

## Integration  
Install [Home Assistant Community Store](HACS.md) First 
Go to HACS in your sidebar.  
Go to Integrations  
Search for Frigate  
Download/Install the Integration  
Restart HA  

~While Frigate (Add-on) is running (doesnt matter if it's working), go to Settings > Devices & services > Integrations > Add Integration
~Search for Frigate
~Install it

Once your yaml is all set
Integrations > Frigate > Settings > Reload


## YAML Config  
Add a config to frigate.yaml
Fill out mqtt with the information from the MQTT Integration
The go2rtc stream is somewhat camera dependent. This is the format for Tapo cameras:
The port is always 554
The endpoint is always `stream1` or `stream2`
`rtsp://<USER>:<PASSWORD>@<CAMERA_IP>:554/stream1` 

```mqtt: 
  enabled: True
  host: 127.0.0.1
  port: 1883
  topic_prefix: frigate
  user: hass-bot
  password: hass-pass
  
go2rtc:
  streams:
    foscam01-hd: 
      - rtsp://foscam01user:q57r2CmEXh@192.168.3.170:88/videoMain
      - "ffmpeg:foscam01-hd#audio=aac" 
    foscam01-sd: 
      - rtsp://foscam01user:q57r2CmEXh@192.168.3.170:88/videoSub
      - "ffmpeg:foscam01-sd#audio=aac" 
    tapocam01-hd: 
      - rtsp://tapoadmin:9Nwdy68YsFunGF@192.168.3.171:554/stream1
      - "ffmpeg:tapocam01-hd#audio=aac" 
    tapocam01-sd: 
      - rtsp://tapoadmin:9Nwdy68YsFunGF@192.168.3.171:554/stream2
      - "ffmpeg:tapocam01-sd#audio=aac" 
    tapocam02-hd: 
      - rtsp://tapoadmin:9Nwdy68YsFunGF@192.168.3.172:554/stream1
      - "ffmpeg:tapocam02-hd#audio=aac" 
    tapocam02-sd: 
      - rtsp://tapoadmin:9Nwdy68YsFunGF@192.168.3.172:554/stream2
      - "ffmpeg:tapocam02-sd#audio=aac" 

cameras:
  foscam01-hd: # <------ Name the camera
    ffmpeg:
      output_args:
        record: preset-record-generic-audio-aac
      inputs:
        - path: rtsp://127.0.0.1:8554/foscam01-hd # <----- The stream you want to use for detection
          roles:
            - detect
    detect:
      enabled: False # <---- disable detection until you have a working camera feed
  foscam01-sd: # <------ Name the camera
    ffmpeg:
      output_args:
        record: preset-record-generic-audio-aac
      inputs:
        - path: rtsp://127.0.0.1:8554/foscam01-sd # <----- The stream you want to use for detection
          roles:
            - detect
    detect:
      enabled: False # <---- disable detection until you have a working camera feed
  tapocam01-hd: # <------ Name the camera
    ffmpeg:
      output_args:
        record: preset-record-generic-audio-aac
      inputs:
        - path: rtsp://127.0.0.1:8554/tapocam01-hd # <----- The stream you want to use for detection
          roles:
            - detect
    detect:
      enabled: False # <---- disable detection until you have a working camera feed
  tapocam01-sd: # <------ Name the camera
    ffmpeg:
      output_args:
        record: preset-record-generic-audio-aac
      inputs:
        - path: rtsp://127.0.0.1:8554/tapocam01-sd # <----- The stream you want to use for detection
          roles:
            - detect
    detect:
      enabled: False # <---- disable detection until you have a working camera feed
  tapocam02-hd: # <------ Name the camera
    ffmpeg:
      output_args:
        record: preset-record-generic-audio-aac
      inputs:
        - path: rtsp://127.0.0.1:8554/tapocam02-hd # <----- The stream you want to use for detection
          roles:
            - detect
    detect:
      enabled: False # <---- disable detection until you have a working camera feed
  tapocam02-sd: # <------ Name the camera
    ffmpeg:
      output_args:
        record: preset-record-generic-audio-aac
      inputs:
        - path: rtsp://127.0.0.1:8554/tapocam02-sd # <----- The stream you want to use for detection
          roles:
            - detect
    detect:
      enabled: False # <---- disable detection until you have a working camera feed

```