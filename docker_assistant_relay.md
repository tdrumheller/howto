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
    tdrumhel/docker-assistant-relay:v3
```
Had to:
1. start another docker instance with sh
1. change the google auth version in package.json to from 0.6 to 0.2
1. `npm install`
1. change `server/configurations/config.json` to use port 30001
1. get code, paste into original container

If restarting:
1. go to setup
1. reupload json file - should save that off
1. get new auth code
1. paste into webapp

```
docker run --rm -d \
    --name assistant-relay -p 3000:3000 \
    -v /opt/dar/secrets:/assistant-relay/server/configurations/secrets:ro \
    -v /opt/dar/tokens:/assistant-relay/server/configurations/tokens:ro \
    -e TZ=America/New_York \
    tdrumhel/docker-assistant-relay:v3
```
* In config, need to change baseUrl (either on host or in container)
* may need to adjust quiet hours, or turn off


### Docker, part 2
Updated to use v3.2, in docker-assistant-relay repo

* Look into adding devices

### Hooking Up
Once home assistant is running, a cURL command can interact (from `localhost` or using the hostname):
```
curl -H 'Content-Type: application/json' -d '{"user": "tom", "command": "ask fordpass to lock my car"}' localhost:3000/assistant
```
Note that the header needs to be set.

In the cron file:
```
00 22 * * * curl -H 'Content-Type: application/json' -d '{"user": "tom", "command": "ask fordpass to lock my car"}' localhost:3000/assistant
```
