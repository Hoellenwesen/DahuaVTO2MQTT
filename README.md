# DahuaVTO2MQTT
_Listens to events from all Dahua devices - VTO, Camera, NVR unit and publishes them via MQTT Message_

[Dahua VTO MQTT Events - examples](https://gitlab.com/elad.bar/DahuaVTO2MQTT/-/blob/master/MQTTEvents.MD)

[Supported Models](https://gitlab.com/elad.bar/DahuaVTO2MQTT/-/blob/master/SupportedModels.md)

## How to install
### Docker Compose
```dockerfile
version: '2'
services:
  dahuavto2mqtt:
    image: "ghcr.io/hoellenwesen/dahuavto2mqtt:latest"
    container_name: "dahuavto2mqtt"
    hostname: "dahuavto2mqtt"
    restart: always
    environment:
      - DAHUA_VTO_HOST=vto-host
      - DAHUA_VTO_SSL=False
      - DAHUA_VTO_USERNAME=Username
      - DAHUA_VTO_PASSWORD=Password
      - MQTT_BROKER_HOST=mqtt-host
      - MQTT_BROKER_PORT=1883
      - MQTT_BROKER_USERNAME=Username
      - MQTT_BROKER_PASSWORD=Password 
      - MQTT_BROKER_TOPIC_PREFIX=DahuaVTO
      - MQTT_BROKER_CLIENT_ID=DahuaVTO2MQTT
      - DEBUG=False
```

### Environment Variables
| Variable                 | Default       | Required | Description                |
|--------------------------|---------------|----------|----------------------------|
| DAHUA_VTO_HOST           | -             | +        | Dahua VTO hostname or IP   |
| DAHUA_VTO_SSL            | False         | -        | Secure Connection to VTO   |
| DAHUA_VTO_USERNAME       | -             | +        | Dahua VTO user name        |
| DAHUA_VTO_PASSWORD       | -             | +        | Dahua VTO password         |
| MQTT_BROKER_HOST         | -             | +        | MQTT Broker hostname or IP |
| MQTT_BROKER_PORT         | -             | +        | MQTT Broker port           |
| MQTT_BROKER_USERNAME     | -             | +        | MQTT Broker user name      |
| MQTT_BROKER_PASSWORD     | -             | +        | MQTT Broker password       |
| MQTT_BROKER_TOPIC_PREFIX | DahuaVTO      | -        | Topic to publish messages  |
| MQTT_BROKER_CLIENT_ID    | DahuaVTO2MQTT | -        | MQTT Broker client ID      |
| DEBUG                    | False         | -        | Enable debug log messages  |


## Commands

#### Open Door
By publishing MQTT message of {MQTT_BROKER_TOPIC_PREFIX}/Command/Open an HTTP request to the unit will be sent,
If the payload of the message is empty, default door to open is 1,
If unit supports more than 1 door, please add to the payload `Door` parameter with the number of the door 

## Changelog

### 2022-May-19

- Fix wrong call to function

### 2022-May-17

- Additional optimization to MQTT connection

### 2022-May-15

- MQTT Broker reconnect fix

### 2022-Feb-16

- Fix event handling

### 2022-Jan-20

- MQTT Broker reconnect after 60 seconds

### 2022-Jan-07

- Restructure code (2 clients - Dahua and MQTT)
- Added support to mute call once ring using topic `DahuaVTO/Command/Mute`

## Credits
- Forked from [elad-bar][source]
- All credits goes to <a href="https://github.com/riogrande75">@riogrande75</a> who wrote that complicated integration
- Original code can be found in <a href="https://github.com/riogrande75/Dahua">@riogrande75/Dahua</a>

[source]: https://gitlab.com/elad.bar/DahuaVTO2MQTT