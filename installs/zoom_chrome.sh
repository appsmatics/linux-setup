### installing zoom
DEST_DIR="${DEST_DIR:-"$HOME/opt"}"

ZOOM_FOLDER="$DEST_DIR/zoom"
apt --fix-broken install
sudo apt --fix-broken install
#sudo dpkg -i zoom_amd64.deb
echo "zoom install started"
mkdir -p "$ZOOM_FOLDER"
cd $ZOOM_FOLDER
echo ".. downloading zoom deb"
curl https://zoom.us/client/latest/zoom_amd64.deb
sudo apt install ./zoom_amd64.deb
echo "zoom installed successfully"

### installing chrome
CHROME_FOLDER="$DEST_DIR/chrome"

echo "chrome install started"
mkdir -p "$CHROME_FOLDER"
cd $CHROME_FOLDER
echo ".. downloading chrome deb"
curl -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update
sudo apt-get install google-chrome-stable
echo "chrome installed successfully"
