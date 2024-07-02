### lazygit setup:
##### Download the required version from https://github.com/jesseduffield/lazygit/releases

OPT_DIR="$HOME/opt"

##### installing lazygit
OPT_DIR="$HOME/opt"
LAZYGIT_VERSION="0.40.0"
LAZYGIT_X86="lazygit_${LAZYGIT_VERSION}_Linux_x86_64"
LAZYGIT_TAR_DOWNLOAD_LINK="https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"

#"https://github.com/jesseduffield/lazygit/releases/download/v$LAZYGIT_VERSION/lazygit_$(LAZYGIT_VERSION)_Linux_arm64.tar.gz"

LAZYGIT_X86_FOLDER="$OPT_DIR/lazygit/$LAZYGIT_X86"

if [[ -d "$LAZYGIT_X86_FOLDER" ]]
then
  cd "$OPT_DIR/lazygit"
  if [[ -d "current" ]]
  then
  echo "removing current version"
  rm current
  fi
  ln -s $LAZYGIT_X86 current
  echo "lazygit $LAZYGIT_VERSION already available .. current version updated"
else
  curl -LO  $LAZYGIT_TAR_DOWNLOAD_LINK
  echo "installing lazygit $LAZYGIT_VERSION"
  mkdir  -p "$LAZYGIT_X86_FOLDER"
  mv $HOME/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz $LAZYGIT_X86_FOLDER
  cd $LAZYGIT_X86_FOLDER
  tar -xf lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz
  cd "$OPT_DIR/lazygit"
  if [[ -d "current" ]]
  then
  echo "removing current version"
  rm current
  fi
  ln -s $LAZYGIT_X86 current
  echo "lazygit version $LAZYGIT_VERSION installed"
fi

