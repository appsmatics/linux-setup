### lazygit setup:
##### Download the required version from https://github.com/jesseduffield/lazygit/releases
##### installing lazygit
LAZYGIT_VERSION="0.42.0"
DEST_DIR="${DEST_DIR:-"$HOME/opt"}"

LAZYGIT_X86="lazygit_${LAZYGIT_VERSION}_Linux_x86_64"
LAZYGIT_TAR_DOWNLOAD_LINK="https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"

#"https://github.com/jesseduffield/lazygit/releases/download/v$LAZYGIT_VERSION/lazygit_$(LAZYGIT_VERSION)_Linux_arm64.tar.gz"

LAZYGIT_FOLDER="$DEST_DIR/lazygit"
LAZYGIT_X86_FOLDER="$LAZYGIT_FOLDER/$LAZYGIT_X86"

if [[ -d "$LAZYGIT_X86_FOLDER" ]]
then
  echo ".. lazygit version $LAZYGIT_VERSION already exists"
else
  echo ".. installing lazygit $LAZYGIT_VERSION"
  mkdir -p "$LAZYGIT_X86_FOLDER"
  cd $LAZYGIT_FOLDER
  echo ".. downloading lazygit $LAZYGIT_VERSION"
  curl -LO  $LAZYGIT_TAR_DOWNLOAD_LINK
  echo "..extracting lazygit tar file..."
  tar -xf lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz -C $LAZYGIT_X86_FOLDER
  echo ".. lazygit version $LAZYGIT_VERSION installed"
fi

# Always update the current symlink
echo ".. resetting current symlink"
cd "$DEST_DIR/lazygit"
if [[ -d "current" ]]
then
  rm current
fi
ln -s $LAZYGIT_X86 current
echo ".. lazygit $LAZYGIT_VERSION  .. current symlink updated"
