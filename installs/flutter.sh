# setup vars needed:
FLUTTER_VERSION="${FLUTTER_VERSION:-"3.22.2"}"
DEST_DIR="${DEST_DIR:-"$HOME/opt"}"

PLATFORM_TOOLS_VERSION="34.0.1"
TOOLS_VERSION="25.2.3"

# installing flutter
echo "FLUTTER_VERSION=$FLUTTER_VERSION"
echo "DEST_DIR=$DEST_DIR"
echo "PLATFORM_TOOLS_VERSION=$PLATFORM_TOOLS_VERSION"
echo "TOOLS_VERSION=$TOOLS_VERSION"

FLUTTER_FOLDER="$DEST_DIR/flutter"
FLUTTER_VERSION_FOLDER="$FLUTTER_FOLDER/flutter-$FLUTTER_VERSION"
FLUTTER_TAR_DOWNLOAD_LINK="https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}-stable.tar.xz"

PLATFORM_TOOLS_DOWNLOAD_LINK="https://dl.google.com/android/repository/platform-tools_r${PLATFORM_TOOLS_VERSION}-linux.zip"
TOOLS_DOWNLOAD_LINK="https://dl.google.com/android/repository/tools_r${TOOLS_VERSION}-linux.zip"



if [[ -d "$FLUTTER_VERSION_FOLDER" ]]
then
  echo "flutter $FLUTTER_VERSION already available .. skipping"
else
  mkdir  -p "$FLUTTER_FOLDER" 
  cd $FLUTTER_FOLDER
  echo "downloading flutter $FLUTTER_VERSION"
  curl -LO  $FLUTTER_TAR_DOWNLOAD_LINK
  echo "installing flutter $FLUTTER_VERSION"
  echo "untaring the file started..."
  echo "extracting flutter-${FLUTTER_VERSION} tar file..."
  tar -xf flutter_linux_${FLUTTER_VERSION}-stable.tar.xz
  # TODO: is this correct?
  mv flutter $FLUTTER_VERSION_FOLDER
fi

# Always update the current symlink
echo "resetting current symlink"
cd "$FLUTTER_FOLDER"
if [[ -d "current" ]]
then
  rm current
fi
ln -s $FLUTTER_VERSION_FOLDER current
echo "flutter $FLUTTER_VERSION  .. current symlink updated"
cd


  
# android sdk setup: 
echo "starting android sdk setup.."
mkdir -p $DEST_DIR/android/sdk
cd $DEST_DIR/android/sdk


# download the platfom tools from 
if [[ -a "platform-tools_r${PLATFORM_TOOLS_VERSION}-linux.zip" ]]
then
  echo "platrform-tools version $PLATFORM_TOOLS_VERSION already exists..skipping"
else
echo "downloading platform-tools-${PLATFORM_TOOLS_VERSION}.."
curl -LO $PLATFORM_TOOLS_DOWNLOAD_LINK
fi
echo "unzipping platform-tools_r${PLATFORM_TOOLS_VERSION} tar file..."
unzip  platform-tools_r${PLATFORM_TOOLS_VERSION}-linux.zip

#mv platform-tools platform-tools-${PLATFORM_TOOLS_VERSION}

# use appropriate version
#mv platform-tools platform_tools_x.y.z
#ln -s platform-tools-${PLATFORM_TOOLS_VERSION} current
flutter config --android-sdk="$HOME/opt/android/sdk"
flutter doctor --android-licenses
flutter doctor -v


  
## android tools download:
if [[ -a "tools_r${TOOLS_VERSION}-linux.zip" ]]
then
  echo "tools version $TOOLS_VERSION already exists..skipping"
else
#curl https://dl.google.com/android/repository/tools_r25.2.3-linux.zip
echo "downloading tools-${TOOLS_VERSION}..."
curl -LO $TOOLS_DOWNLOAD_LINK
fi
echo "unzipping tools-${TOOLS_VERSION}..."
unzip  tools_r${TOOLS_VERSION}-linux.zip
ln -s tools current
echo "tools-${TOOLS_VERSION}  .. current symlink updated"


### commandlinetools download and installation:(cmdline-tools component is missing fix)
#ref link:https://linuxopsys.com/install-android-sdk-without-android-studio-on-ubuntu
#commandlinetools download link:https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip
cd opt/android/sdk
echo "latest command line tools are downloading..."
if [[ -a "commandlinetools-linux-11076708_latest.zip" ]]
then
  echo "commandlinetools version latest version already exists..skipping"
else
curl -LO "https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip"
fi
echo "unzipping the commandline tools..."
unzip  commandlinetools-linux-11076708_latest.zip 
cd cmdline-tools/
mkdir latest 
mv -i * latest
echo "command line tools are ready..."

### java version missing error:
echo "installing the java version..."
apt install openjdk-17-jdk openjdk-17-jre
sudo apt install openjdk-17-jdk openjdk-17-jre

flutter config --android-sdk="$DEST_DIR/android/sdk"
flutter doctor -v


### required sdk tools installation command:
echo "do these step manually to install required sdk tools"
echo "cd opt/android/sdk/cmdline-tools/latest/bin"
echo "sdkmanager --list"
echo "find the available platforms and build-tools version above"
echo 'sdkmanager "platforms;version" "build-tools;version"'
echo 'ex: sdkmanager "platforms;android-30" "build-tools;30.0.0"'
echo "sdkmanager --licenses"


  
### important: setting env path for android setup
# android sdk version path
#export PATH="$DEST_DIR/android/sdk/current/bin:$PATH"
#export PATH="$DEST_DIR/android/sdk/platform-tools/bin:$PATH"
#export PATH="$DEST_DIR/android/sdk/cmdline-tools/latest/bin/:$PATH"
