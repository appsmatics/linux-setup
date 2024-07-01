### nodejs setup:
##### download nodejs tar file(https://nodejs.org/dist/v20.15.0/node-v20.15.0-linux-x64.tar.xz)

# TODO; use this version
NODEJS_VERSION="18.17.1"

NODEJS_DIR="$OPT_DIR/nodejs"

mkdir -p $NODEJS_DIR
mv $HOME/Downloads/node-v20.15.0-linux-x64.tar.xz $NODEJS_DIR
cd $NODEJS_DIR
tar -xf node-v20.15.0-linux-x64.tar.xz
ln -s node-v20.15.0-linux-x64 current
