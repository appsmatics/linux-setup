### lazygit setup:
##### Download the required version from https://github.com/jesseduffield/lazygit/releases

##### installing lazygit
LAZYGIT_TAR_DOWNLOAD_LINK="https://github.com/jesseduffield/lazygit/releases/download/v0.42.0/lazygit_0.42.0_Linux_x86_64.tar.gz"
LAZYGIT_VERSION="lazygit_0.42.0_Linux_x86_64"
if [[ -d "$HOME/opt/lazygit/$LAZYGIT_VERSION" ]]
then
  echo "lazygit $LAZYGIT_VERSION already available .. skipping"
else
  echo "installing lazygit $LAZYGIT_VERSION"
  mkdir -p "$HOME/opt/lazygit/$LAZYGIT_VERSION"
  mkdir -p $HOME/opt/lazygit/lazygit_0.42.0_Linux_x86_64
  mv $HOME/Downloads/lazygit_0.42.0_Linux_x86_64.tar.gz $HOME/opt/lazygit/lazygit_0.42.0_Linux_x86_64
  cd $HOME/opt/lazygit/lazygit_0.42.0_Linux_x86_64
  tar -xf lazygit_0.42.0_Linux_x86_64.tar.gz
  ln -s lazygit_0.42.0_Linux_x86_64 current
fi
