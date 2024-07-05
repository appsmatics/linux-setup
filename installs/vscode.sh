### vscode setup:
##### download vscode tar file(https://update.code.visualstudio.com/{version}/linux-x64/stable)
DEST_DIR="$HOME/opt"
CODE_VERSION="1.83.1"
#cur_ver:"1.90.2"
CODE_DIR="$DEST_DIR/vscode"
CODE_X64="VSCode-${CODE_VERSION}-linux-x64"
CODE_FOLDER="$CODE_DIR/$CODE_X64"
CODE_TAR_DOWNLOAD_LINK=https://update.code.visualstudio.com/${CODE_VERSION}/linux-x64/stable

if [[ -d "$CODE_FOLDER" ]]
then
  echo ".. CODE version $CODE_VERSION already exists"
else
 mkdir -p $CODE_DIR
 cd $CODE_DIR
 echo "...downloading vscode $CODE_VERSION"
 curl -Lo code-stable-v${CODE_VERSION}-x64.tar.xz $CODE_TAR_DOWNLOAD_LINK
 echo "..extracting  vscode $CODE_VERSION tar file"
 tar -xf code-stable-v${CODE_VERSION}-x64.tar.xz
 mv VSCode-linux-x64 VSCode-${CODE_VERSION}-linux-x64
fi

# Always update the current symlink
echo ".. resetting current symlink"
cd $CODE_DIR
if [[ -d "current" ]]
then
  rm current
fi
ln -s VSCode-${CODE_VERSION}-linux-x64 current
echo ".. vscode $CODE_VERSION  .. current symlink updated"