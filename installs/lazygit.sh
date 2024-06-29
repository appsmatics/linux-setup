### lazygit setup:
##### Download the required version from https://github.com/jesseduffield/lazygit/releases

##### installing lazygit
LAXYGIT_VERSION="0.42.0"
LAZYGIT_X86="lazygit_$(LAZYGIT_VERSION)_Linux_x86_64"
LAZYGIT_TAR_DOWNLOAD_LINK="https://github.com/jesseduffield/lazygit/releases/download/v$LAZYGIT_VERSION/$LAZYGIT_X86.tar.gz"
if [[ -d "$HOME/opt/lazygit/$LAZYGIT_X86" ]]
then
  echo "lazygit v$LAZYGIT_VERSION already available .. skipping"
else
  echo "installing lazygit v$LAZYGIT_VERSION"
  mkdir -p "$HOME/opt/lazygit/$LAZYGIT_X86"
  #mkdir -p $HOME/opt/lazygit/lazygit_0.42.0_Linux_x86_64
  mv "$HOME/Downloads/$LAZYGIT_X86.tar.gz" "$HOME/opt/lazygit/$LAZYGIT_X86"
  cd "$HOME/opt/lazygit/$LAZYGIT_X86"
  tar -xf "$LAZYGIT_X86.tar.gz"
fi
