#!/bin/bash
service dbus start
service avahi-daemon start
cd /google-home-notifier
npm install
# Modify browser.js (link: https://github.com/noelportugal/google-home-notifier#after-npm-install)
sed -i 's/rst.getaddrinfo()/rst.getaddrinfo({families:[4]})/' node_modules/mdns/lib/browser.js
node example.js &
tail -f /dev/null
