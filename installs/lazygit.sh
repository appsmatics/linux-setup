### lazygit setup:
##### Download the required version from https://github.com/jesseduffield/lazygit/releases

OPT_DIR="$HOME/opt"

##### installing lazygit
LAZYGIT_VERSION="0.42.0"
LAZYGIT_X86="lazygit_$(LAZYGIT_VERSION)_Linux_x86_64"
LAZYGIT_TAR_DOWNLOAD_LINK="https://github.com/jesseduffield/lazygit/releases/download/v$LAZYGIT_VERSION/$LAZYGIT_X86.tar.gz"
LAZYGIT_X86_FOLDER="$OPT_DIR/lazygit/$LAZYGIT_X86"

if [[ -d "$LAZYGIT_X86_FOLDER" ]]
then
  echo "lazygit v$LAZYGIT_VERSION already available .. skipping"
else
  echo "installing lazygit v$LAZYGIT_VERSION"
  mkdir -p "$LAZYGIT_X86_FOLDER"
  #mkdir -p $OPT_DIR/lazygit/lazygit_0.42.0_Linux_x86_64
  mv "$HOME/Downloads/$LAZYGIT_X86.tar.gz" "$LAZYGIT_X86_FOLDER"
  cd "$LAZYGIT_X86_FOLDER"
  tar -xf "$LAZYGIT_X86.tar.gz"
  cd "$OPT_DIR/lazygit"
  rm current
  ln -s "$LAZYGIT_X86_FOLDER" current
fi
