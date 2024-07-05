### flutter setup:
##### download flutter latest version tar file from flutter page (https://storage.googleapis.com/   flutter_infra_release/releases/stable/linux/flutter_linux_3.22.2-stable.tar.xz)

##### installing flutter
OPT_DIR="$HOME/opt"
FLUTTER_VERSION="3.22.2"
FLUTTER_FOLDER="$OPT_DIR/flutter"
FLUTTER_VERSION_FOLDER="$FLUTTER_FOLDER/flutter-$FLUTTER_VERSION"
FLUTTER_TAR_DOWNLOAD_LINK="https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}-stable.tar.xz"



if [[ -d "$FLUTTER_VERSION_FOLDER" ]]
then
  echo "flutter $FLUTTER_VERSION already available .. skipping"
else
  mkdir  -p "$FLUTTER_FOLDER" 
  cd $FLUTTER_FOLDER
  echo "downloading flutter $FLUTTER_VERSION"
  #curl -LO  $FLUTTER_TAR_DOWNLOAD_LINK
  echo "installing flutter $FLUTTER_VERSION"
  echo "untaring the file started..."
  tar -xf flutter_linux_${FLUTTER_VERSION}-stable.tar.xz
  mv flutter $FLUTTER_VERSION_FOLDER
fi

# Always update the current symlink
echo ".. resettting current symlink"
cd "$FLUTTER_FOLDER"
if [[ -d "current" ]]
then
  rm current
fi
ln -s $FLUTTER_VERSION_FOLDER current
echo ".. flutter $FLUTTER_VERSION  .. current symlink updated"
cd


  
### android sdk setup: 
echo "starting android sdk setup.."
mkdir -p $OPT_DIR/android/sdk
cd $OPT_DIR/android/sdk

PLATFORM_TOOLS_VERSION="34.0.1"

PLATFORM_TOOLS_DOWNLOAD_LINK="https://dl.google.com/android/repository/platform-tools_r${PLATFORM_TOOLS_VERSION}-linux.zip"

#### download the platfom tools from 
if [[ -a "platform-tools_r${PLATFORM_TOOLS_VERSION}-linux.zip" ]]
then
  echo "platrform-tools version $PLATFORM_TOOLS_VERSION already exists..skipping"
else
curl -LO $PLATFORM_TOOLS_DOWNLOAD_LINK
fi
unzip  platform-tools_r${PLATFORM_TOOLS_VERSION}-linux.zip
#mv platform-tools platform-tools-${PLATFORM_TOOLS_VERSION}
#### use appropriate version
#mv platform-tools platform_tools_x.y.z
#ln -s platform-tools-${PLATFORM_TOOLS_VERSION} current
flutter config --android-sdk="$HOME/opt/android/sdk"
flutter doctor --android-licenses
flutter doctor -v

TOOLS_VERSION="25.2.3"

#LAZYGIT_X86="lazygit_${LAZYGIT_VERSION}_Linux_x86_64"
TOOLS_DOWNLOAD_LINK="https://dl.google.com/android/repository/tools_r${TOOLS_VERSION}-linux.zip"
  
### android tools download:
if [[ -a "tools_r${TOOLS_VERSION}-linux.zip" ]]
then
  echo "tools version $TOOLS_VERSION already exists..skipping"
else
#curl https://dl.google.com/android/repository/tools_r25.2.3-linux.zip
curl -LO $TOOLS_DOWNLOAD_LINK
fi
unzip  tools_r${TOOLS_VERSION}-linux.zip
ln -s tools current


### jdk not found error fix:
sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt-get update
sudo apt-get install openjdk-8-jdk



### continuing android sdk location error fix,cmdline-tools missing:  
cd opt/android/sdk/tools/bin
sdkmanager --install "cmdline-tools;latest"
flutter doctor
  


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
unzip  commandlinetools-linux-11076708_latest.zip 
cd cmdline-tools/
mkdir tools 
mv -i * tools
cho "command line tools are ready..."


### required sdk tools installation command:
echo "installing required sdk tools.."
flutter config --android-sdk="$OPT_DIR/android/sdk"
cd opt/android/sdk/cmdline-tools/tools/bin
sdkmanager "platforms;android-30" "build-tools; 29.0.3"
sdkmanager --licenses -y
echo "sdk tools(platforms;android-30" "build-tools; 29.0.3) installed.."



### java version missing error:
apt install openjdk-17-jdk openjdk-17-jre
sudo apt install openjdk-17-jdk openjdk-17-jre

flutter doctor -v
  
 << com   
### Connected device (the doctorcheck is crashed):
Downgraded the platform-tools version from 35.0.1 to 34.0.0
Unable to run "adb", check your Android SDK installation and ANDROID_HOME environment variable: /home/ajith/opt/android/sdk/platform-tools/adb
https://github.com/flutter/flutter/issues/142996 (rudentsov answer)474  flutter doctor --android-licenses

### android license status unknown fix
cd opt/android/sdk/tools/bin
sdkmanager --licenses
  sdk/cmdline-tools/bin  changed to sdk/cmdline-tools/latest/bin
    cmdline-tools/
https://stackoverflow.com/questions/70719767/android-sdkmanager-not-found-update-to-the-latest-android-sdk-and-ensure-that-t (answer by divillysausages)
### important: setting env path for android setup
  # android sdk version path
export PATH="$OPT_DIR/android/sdk/current/bin:$PATH"
export PATH="$OPT_DIR/android/sdk/platform-tools/bin:$PATH"
export PATH="$OPT_DIR/android/sdk/cmdline-tools/latest/bin/:$PATH"
com