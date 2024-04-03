LOGGED_USER=`stat -f%Su /dev/console` 
sudo su $LOGGED_USER -c 'defaults write com.apple.dock iconsize -integer <dock size>' 
killall Dock 
