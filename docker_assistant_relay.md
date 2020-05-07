# Docker Assistant Relay

## Purpose
Interact with google assistant via a rest api

## Setup
* Follow steps in [guide](dar2_readme.md)
  * create project
  * Reg code
  * dowload json
  * enable api


### Docker
copy the oath file from above to `/opt/dar/secrets/<user>.json`
```
docker run --rm -it \
    -v /opt/dar/secrets:/assistant-relay/server/configurations/secrets \
    -v /opt/dar/tokens:/assistant-relay/server/configurations/tokens \
    kmlucy/docker-assistant-relay
```
Had to:
1. start another docker instance with sh
1. change the google auth version in package.json to from 0.6 to 0.2
1. `npm install`
1. change `server/configurations/config.json` to use port 30001
1. get code, paste into original container

```
docker run --rm -d \
    --name assistant-relay -p 3000:3000 \
    -v /opt/dar/secrets:/assistant-relay/server/configurations/secrets:ro \
    -v /opt/dar/tokens:/assistant-relay/server/configurations/tokens:ro \
    -e TZ=America/New_York \
    kmlucy/docker-assistant-relay
```
In config, need to change baseUrl (either on host or in container)

### Hooking Up