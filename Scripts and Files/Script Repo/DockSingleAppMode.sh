LOGGED_USER=`stat -f%Su /dev/console` 
sudo su $LOGGED_USER -c 'defaults write com.apple.dock single-app -bool true'   
killall Dock 
