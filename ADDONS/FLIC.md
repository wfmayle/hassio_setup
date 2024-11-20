# FLIC
Go to Settings > Add-ons > Add-On Store  
Add a repository: https://github.com/pschmitt/home-assistant-addons  
Refresh the page  
Search for 'flicd' and install it  

Edit /homeassistant/configuration.yaml  

```
device_tracker:
  - platform: bluetooth_le_tracker
```

Start the service  
Press and hold flic for ~7 seconds. There will be a quick flash of the led if it pairs.  
You may need to restart Home Assistant to pair an additional button.  




### TODO: Need to update this with the Hub setup
Setup in phone app?


Edit /homeassistant/template.yaml
```
  - trigger:
      - platform: webhook
        webhook_id: flic2-2F-KitchenLights
        local_only: true

    binary_sensor:
      - unique_id: "2F-KitchenLights_button"
        name: "2F-KitchenLightsButton"
        state: "on"
        auto_off: 0.1
        attributes:
          click-type: "{{ trigger.json.click_type }}"
          battery: "{{ trigger.json.battery_status }}"

  - trigger:
      - platform: webhook
        webhook_id: flic2-1F-CariLights
        local_only: true
        
    binary_sensor:
      - unique_id: "1F-CariLights_button"
        name: "1F-CariLightsButton"
        state: "on"
        auto_off: 0.1
        attributes:
          click-type: "{{ trigger.json.click_type }}"
          battery: "{{ trigger.json.battery_status }}"

  - trigger:
      - platform: webhook
        webhook_id: flic2-2F-LivingRoomLights
        local_only: true

    binary_sensor:
      - unique_id: "2F-LivingRoomLights_button"
        name: "2F-LivingRoomLightsButton"
        state: "on"
        auto_off: 0.1
        attributes:
          click-type: "{{ trigger.json.click_type }}"
          battery: "{{ trigger.json.battery_status }}"
```