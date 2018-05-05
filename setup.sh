#!/bin/bash
DIR=$(dirname $0)
DEVICE_NAME='device_name' # your google home name
GOOGLE_HOME_IP='192.168.1.20' # your google home ip address
LANGUAGE='pl' # your language
PORT=8091 # local port as 'Rest-API'

arch | grep 'arm' > /dev/null 2>&1 \
&& sed -i 's/^FROM .*debian$/FROM armhf\/debian/g' Dockerfile\
|| sed -i 's/^FROM .*debian$/FROM debian/g' Dockerfile

ls google-home-notifier > /dev/null 2>&1 || git clone https://github.com/noelportugal/google-home-notifier
cd ${DIR}/google-home-notifier
git checkout .

# setting your info
sed -i "s/'Google Home'/'${DEVICE_NAME}'/g" example.js
sed -i s/192.168.1.20/${GOOGLE_HOME_IP}/g example.js
sed -i "s/'pl'/'${LANGUAGE}'/g" example.js
echo PORT=${PORT} > ../.env

echo -e "Finished setting.\nPlease run 'docker-compose up'."
