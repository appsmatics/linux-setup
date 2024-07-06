### oraclejdk setup:
##### download oraclejdk tar file(https://download.oracle.com/java/17/archive/jdk-17_linux-x64_bin.tar.gz)
DEST_DIR="$HOME/opt"
ORACLE_JDK_VERSION="17"
ORACLE_JDK_FOLDER="$DEST_DIR/oraclejdk"
ORACLE_JDK_X64="jdk-$ORACLE_JDK_VERSION"
ORACLE_JDK_VERSION_FOLDER="$ORACLE_JDK_FOLDER/$ORACLE_JDK_X64"
ORACLE_JDK_TAR_DOWNLOAD_LINK=https://download.oracle.com/java/${ORACLE_JDK_VERSION}/archive/jdk-${ORACLE_JDK_VERSION}_linux-x64_bin.tar.gz

if [[ -d "$ORACLE_JDK_VERSION_FOLDER" ]]
then
  echo ".. oraclejdk version $ORACLE_JDK_VERSION already exists"
else
 echo ".. installing oraclejdk $ORACLE_JDK_VERSION"
 mkdir -p $ORACLE_JDK_FOLDER
 cd $ORACLE_JDK_FOLDER
 echo "...downloading oraclejdk $ORACLE_JDK_VERSION"
 curl -LO  $ORACLE_JDK_TAR_DOWNLOAD_LINK
 echo "extracting oraclejdk-$ORACLE_JDK_VERSION tar file..."
 tar -xf jdk-${ORACLE_JDK_VERSION}_linux-x64_bin.tar.gz
fi


# Always update the current symlink
echo ".. resetting current symlink"
cd $ORACLE_JDK_FOLDER
if [[ -d "current" ]]
then
  rm current
fi
ln -s jdk-${ORACLE_JDK_VERSION} current
echo ".. oraclejdk $ORACLE_JDK_VERSION  .. current symlink updated"

