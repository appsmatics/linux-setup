### javajdk setup:
##### download javajdk tar file(https://download.oracle.com/java/17/archive/jdk-17_linux-x64_bin.tar.gz)
DEST_DIR="$HOME/opt"
JAVAJDK_VERSION="17"
JAVAJDK_FOLDER="$DEST_DIR/javajdk"
JAVAJDK_X64="jdk-$JAVAJDK_VERSION"
JAVAJDK_VERSION_FOLDER="$JAVAJDK_FOLDER/$JAVAJDK_X64"
JAVAJDK_TAR_DOWNLOAD_LINK=https://download.oracle.com/java/${JAVAJDK_VERSION}/archive/jdk-${JAVAJDK_VERSION}_linux-x64_bin.tar.gz

if [[ -d "$JAVAJDK_VERSION_FOLDER" ]]
then
  echo ".. javajdk version $JAVAJDK_VERSION already exists"
else
 echo ".. installing javajdk $JAVAJDK_VERSION"
 mkdir -p $JAVAJDK_FOLDER
 cd $JAVAJDK_FOLDER
 echo "...downloading javajdk $JAVAJDK_VERSION"
 curl -LO  $JAVAJDK_TAR_DOWNLOAD_LINK
 echo "extracting javajdk-$JAVAJDK_VERSION tar file..."
 tar -xf jdk-${JAVAJDK_VERSION}_linux-x64_bin.tar.gz
fi


# Always update the current symlink
echo ".. resetting current symlink"
cd $JAVAJDK_FOLDER
if [[ -d "current" ]]
then
  rm current
fi
ln -s jdk-${JAVAJDK_VERSION} current
echo ".. javajdk $JAVAJDK_VERSION  .. current symlink updated"

