#!/bin/sh

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
# ABOUT THIS SCRIPT
#
#       Purpose: Closes VPN connection. Deletes all DNS Servers and 
#                Search Domains. Executes an IP Release/Renew.
#
#       IMPORTANT: A network connection is required to execute. To be 
#                  executed if user is experiencing proxy or ip error 
#                  message.
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# START PROCESS
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

#Force Quit Tunnelblick
sudo killall "$VPN"

#Delete all DNS Servers
sudo networksetup -setdnsservers Wi-Fi empty

#Delete Search Domains
sudo networksetup -setsearchdomains Wi-Fi empty

#Release DHCP
sudo ifconfig en0 down

#Renew DHCP
sudo ifconfig en0 up
