# setup vars needed:
# FLUTTER_VERSION="${FLUTTER_VERSION:-"3.24.3"}"
# DEST_DIR="${DEST_DIR:-"$HOME/opt"}"

# echo "Flutter version = $FLUTTER_VERSION"
# echo "Android version = $ANDROID_VERSION"




#PLATFORM_TOOLS_VERSION="34.0.1"
# ANDROID_VERSION="34"
# BUILD_TOOLS_VERSION="34.0.0"
#TOOLS_VERSION="25.2.3"

# installing flutter
echo "FLUTTER_VERSION=$FLUTTER_VERSION"
echo "DEST_DIR=$DEST_DIR"
echo "OS=$OS, REQUIRED_OS=$REQUIRED_OS"

#echo "PLATFORM_TOOLS_VERSION=$PLATFORM_TOOLS_VERSION"
#echo "TOOLS_VERSION=$TOOLS_VERSION"


FLUTTER_FOLDER="$DEST_DIR/flutter"
FLUTTER_VERSION_FOLDER="$FLUTTER_FOLDER/flutter-$FLUTTER_VERSION"
FLUTTER_DOWNLOAD_LINK=""


if [ $REQUIRED_OS = "mac" ]; then
  FLUTTER_DOWNLOAD_LINK="https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_${FLUTTER_VERSION}-stable.zip"
else
  FLUTTER_DOWNLOAD_LINK="https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}-stable.tar.xz"
fi
PLATFORM_TOOLS_DOWNLOAD_LINK="https://dl.google.com/android/repository/platform-tools_r${PLATFORM_TOOLS_VERSION}-linux.zip"
TOOLS_DOWNLOAD_LINK="https://dl.google.com/android/repository/tools_r${TOOLS_VERSION}-linux.zip"

printf 'Continue ? '; read answer

if [[ -d "$FLUTTER_VERSION_FOLDER" ]]; then
  echo "flutter $FLUTTER_VERSION already available .. skipping"
else
  mkdir  -p "$FLUTTER_FOLDER" 
  cd $FLUTTER_FOLDER
  echo "downloading flutter $FLUTTER_VERSION"
  echo "downloading link: $FLUTTER_DOWNLOAD_LINK"
  curl -LO  $FLUTTER_DOWNLOAD_LINK
  echo "installing flutter $FLUTTER_VERSION"
  echo "printing OS $OS"
  if [ $OS = "Darwin" ];then
    echo "unzipping the file started..."
    echo "extracting flutter-${FLUTTER_VERSION} zip file..."
    unzip flutter_macos_${FLUTTER_VERSION}-stable.zip
  else
    echo "untaring the file started..."
    echo "extracting flutter-${FLUTTER_VERSION} tar file..."
    tar -xf flutter_linux_${FLUTTER_VERSION}-stable.tar.xz
  fi
  # TODO: is this correct?
  mv flutter $FLUTTER_VERSION_FOLDER
fi

# Always update the current symlink
echo "resetting current symlink"
cd "$FLUTTER_FOLDER"
if [[ -d "current" ]]; then
  rm current
fi
ln -s $FLUTTER_VERSION_FOLDER current
echo "flutter $FLUTTER_VERSION  .. current symlink updated"
pwd
cd

printf 'Continue ? '; read answer


# android sdk setup: 
echo "starting android sdk setup.."
ANDROID_SDK_HOME=$DEST_DIR/android/sdk
mkdir -p $ANDROID_SDK_HOME
cd $ANDROID_SDK_HOME
pwd


### commandlinetools download and installation:(cmdline-tools component is missing fix)
#ref link:https://linuxopsys.com/install-android-sdk-without-android-studio-on-ubuntu
#commandlinetools download link:https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip
#cd opt/android/sdk
echo "latest command line tools are downloading..."
if [[ -a $CMDLINE_TOOLS_ZIP ]]; then
  echo "commandlinetools version latest version already exists..skipping"
else
  curl -LO $CMDLINE_TOOLS_URL
  echo "unzipping the commandline tools..."
  unzip  $CMDLINE_TOOLS_ZIP 
  cd $ANDROID_SDK_HOME/cmdline-tools
  mkdir latest 
  mv -i * latest
fi
echo "command line tools are ready..."
pwd

printf 'Continue ? '
read answer


### required sdk tools installation command:
cd $ANDROID_SDK_HOME/cmdline-tools/latest/bin
sdkmanager --list
sdkmanager "platforms;android-$ANDROID_VERSION"
sdkmanager "platform-tools"
sdkmanager "build-tools;$BUILD_TOOLS_VERSION"
sdkmanager --licenses



  
### important: setting env path for android setup
# android sdk version path
#export PATH="$DEST_DIR/android/sdk/current/bin:$PATH"
#export PATH="$DEST_DIR/android/sdk/platform-tools/bin:$PATH"
#export PATH="$DEST_DIR/android/sdk/cmdline-tools/latest/bin/:$PATH"
