
# java jdk setup:


echo "starting java jdk setup.."
echo "sourcing versions"
source ./versions.sh


mkdir -p $DEST_DIR/java
cd $DEST_DIR/java

JAVA_JDK_FOLDER="$DEST_DIR/java/jdk-$JAVA_JDK_VERSION.jdk"

# download the required java jdk version 
if [[ -d "jdk-$JAVA_JDK_TAR_VERSION" ]]; then
  echo "java jdk version $JAVA_JDK_TAR_VERSION already exists..skipping"
else
  if [[ -a "$JAVA_JDK_TAR_FILE" ]]; then
    echo "$JAVA_JDK_TAR_FILE file already exists..skipping download"
  else
    echo "downloading java jdk-$JAVA_JDK_VERSION .."
    curl -LO $JAVA_JDK_URL
  fi
  echo "untaring java jdk- $JAVA_JDK_VERSION tar file..."
  tar -xf $JAVA_JDK_TAR_FILE
fi


# Always update the current symlink
echo ".. resetting current symlink for java"
cd "$DEST_DIR/java"
if [[ -d "current" ]]
then
  rm current
fi
ln -s jdk-${JAVA_JDK_TAR_VERSION} current
echo ".. java jdk $JAVA_JDK_VERSION  .. current symlink updated"

printf 'Continue ? '
read answer