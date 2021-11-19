# Home Assistant

## Current Use
Primarily a dashboard. Could evolve into more of a hub,
but mostly using google home/assistant for that now

## To run:
```
sudo docker run --init -d --name="home-assistant" -e "TZ=America/New_York" -v /home/<name>/home_assistant/:
/config --net=host homeassistant/home-assistant:stable
```

Runs, (for me) on [athena:8123](http://athena:8123)

## For setup
### Nabu Casa
1. Integrations > Configuration > Home Assistant Cloud > Login
### Integrations
* Google Cast
* Orbi
* Bond (Need token)
* Brother
* Ecobeer
  * Need token
  * get access key from HA
  * go to hamburger > myapps
  * register

## Update
```
sudo docker stop home-assistant
sudo docker rm home-assistant
sudo docker pull homeassistant/home-assistant:stable
sudo docker run --init -d --name="home-assistant" -e "TZ=America/New_York" -v /home/<name>/home_assistant/:
/config --net=host homeassistant/home-assistant:stable
```

Uses old config