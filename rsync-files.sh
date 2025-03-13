#!/bin/bash

OPT_DIR="$HOME/opt"

### create opt/bin directory
mkdir -vp $OPT_DIR/bin

echo "rsync dotfiles and bin utils"
if [[ -z  "$(rsync -a --info=NAME dotfiles/ $HOME/)" ]]; then
  echo "dotfiles already in sync"
else 
  echo "dotfiles rsynced"
fi
if [[ -z "$(rsync -a --info=NAME bin/ $OPT_DIR/bin/)" ]]; then
  echo "bin files already in sync"
else
  echo "bin files rsynced"
fi
