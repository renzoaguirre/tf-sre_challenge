#!/bin/bash
myip=$(curl -s https://ifconfig.me/ip)
echo {\"ip\":\""$myip"\"}