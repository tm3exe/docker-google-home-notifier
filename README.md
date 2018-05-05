# docker-google-home-notifier
Run google-home-notifier in Docker

## Setup
Modify your environment.  
`$ head -n6 ./setup.sh`
```
#!/bin/bash
DIR=$(dirname $0)
DEVICE_NAME='device_name' # your google home name
GOOGLE_HOME_IP='192.168.1.20' # your google home ip address
LANGUAGE='pl' # your language
PORT=8091 # local port as 'Rest-API'
```
After modify, run './setup.sh'  
`$ bash setup.sh`
```
Cloning into 'google-home-notifier'...
remote: Counting objects: 155, done.
remote: Total 155 (delta 0), reused 0 (delta 0), pack-reused 155
Receiving objects: 100% (155/155), 24.89 KiB | 0 bytes/s, done.
Resolving deltas: 100% (85/85), done.
Finished setting.
Please run 'docker-compose up'.
```

## Usage
`$ docker-compose up -d`

## Check
`$ docker-compose logs -f`
```
google-home-notifier    | Endpoints:
google-home-notifier    |     http://192.168.1.20:8091/google-home-notifier
google-home-notifier    |     https://xxxxxx.ngrok.io/google-home-notifier
google-home-notifier    | GET example:
google-home-notifier    | curl -X GET https://xxxxxx.ngrok.io/google-home-notifier?text=Hello+Google+Home
google-home-notifier    | POST example:
google-home-notifier    | curl -X POST -d "text=Hello Google Home" https://xxxxxx.ngrok.io/google-home-notifier
```
When the endpoint is displayed, it is successful.  
Try run `$ curl http:localhost:8091/google-home-notifier?text=Hello+Google+Home`

## Note
After 'npm install', it created 'node_modules'.  
This directory has permission as root on docker.  
Please change appropriate permission.
