# Home Assistant

## Current Use
Primarily a dashboard. Could evolve into more of a hub,
but mostly using google home/assistant for that now

## To run:
```
sudo docker run --init -d --name="home-assistant" -e "TZ=America/New_York" -v /home/<name>/home_assistant/:
/config --net=host homeassistant/home-assistant:stable
```

Runs, (for me) on (http://athena:8123)[http://athena:8123]
