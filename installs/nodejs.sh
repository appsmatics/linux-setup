### nodejs setup:
##### download nodejs tar file(https://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}-linux-x64.tar.xz)
NODEJS_VERSION="18.17.1"
DEST_DIR="${DEST_DIR:-"$HOME/opt"}"
#cur_ver:"18.17.1"
NODEJS_DIR="$DEST_DIR/nodejs"
NODEJS_X64="node-v${NODEJS_VERSION}-linux-x64"
NODEJS_FOLDER="$NODEJS_DIR/$NODEJS_X64"
NODEJS_TAR_DOWNLOAD_LINK=https://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}-linux-x64.tar.xz

if [[ -d "$NODEJS_FOLDER" ]]
then
  echo ".. nodejs version $NODEJS_VERSION already exists"
else
 mkdir -p $NODEJS_DIR
 cd $NODEJS_DIR
 echo "...downloading nodejs $NODEJS_VERSION"
 curl -LO  $NODEJS_TAR_DOWNLOAD_LINK
 echo "extracting nodjs-{$NODEJS_VERSION} tar file..."
 tar -xf node-v${NODEJS_VERSION}-linux-x64.tar.xz
fi

# Always update the current symlink
echo ".. resetting current symlink"
cd $NODEJS_DIR
if [[ -d "current" ]]
then
  rm current
fi
ln -s node-v${NODEJS_VERSION}-linux-x64 current
echo ".. nodejs $NODEJS_VERSION  .. current symlink updated"


echo ".. installing some node modules globally"
# yarn

echo ".. installing yarn"
./current/bin/npm install --silent --location=global yarn

echo ".. installing npm-check-updates"
./current/bin/npm install --silent --location=global npm-check-updates

echo ".. installing degit"
./current/bin/npm install --silent --location=global degit

# simple http-server and file browser
echo ".. installing http-server"
./current/bin/npm install --silent --location=global http-server

# serve a json file for a quick-n-dirty backend
echo ".. installing json-server"
./current/bin/npm install --silent --location=global json-server 

# for shell scripting
echo ".. installing shelljs"
./current/bin/npm install --silent --location=global shelljs
