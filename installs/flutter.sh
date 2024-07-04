### flutter setup:
##### download flutter latest version tar file from flutter page (https://storage.googleapis.com/   flutter_infra_release/releases/stable/linux/flutter_linux_3.22.2-stable.tar.xz)

##### installing flutter
OPT_DIR="$HOME/opt"
FLUTTER_VERSION="3.22.2"
FLUTTER_FOLDER="$OPT_DIR/flutter"
FLUTTER_TAR_DOWNLOAD_LINK="https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}-stable.tar.xz"


if [[ -d "$FLUTTER_FOLDER" ]]
then
  echo "flutter $FLUTTER_VERSION already available .. skipping"
else
  curl -LO  $FLUTTER_TAR_DOWNLOAD_LINK
  echo "installing flutter $FLUTTER_VERSION"
  mkdir  -p "$FLUTTER_FOLDER"
  mv $HOME/flutter_linux_${FLUTTER_VERSION}-stable.tar.xz $FLUTTER_FOLDER
  cd $FLUTTER_FOLDER
  tar -xf flutter_linux_${FLUTTER_VERSION}-stable.tar.xz
  if [[ -d "current" ]]
  then
  rm current
  fi
  ln -s flutter current
fi



  
### android sdk setup: 
mkdir -p $OPT_DIR/android/sdk/platform-tools
cd $OPT_DIR/android/sdk/platform-tools

PLATFORM_TOOLS_VERSION="34.0.1"

#LAZYGIT_X86="lazygit_${LAZYGIT_VERSION}_Linux_x86_64"
PLATFORM_TOOLS_DOWNLOAD_LINK="https://dl.google.com/android/repository/platform-tools_r${PLATFORM_TOOLS_VERSION}-linux.zip"

#### download the platfom tools from 
curl -LO $PLATFORM_TOOLS_DOWNLOAD_LINK
#mv $HOME/Downloads/platform-tools-latest-linux.zip $OPT_DIR/android/sdk
unzip platform-tools_r${PLATFORM_TOOLS_VERSION}-linux.zip && mv platform-tools platform-tools-${PLATFORM-TOOLS-VERSION}

#### use appropriate version
#mv platform-tools platform_tools_x.y.z
ln -s platform-tools_${PLATFORM_TOOLS_VERSION} current

flutter doctor
  
 << com 
### android sdk not located error started:
  
flutter config --android-sdk /home/ajith/opt/android/sdk/current
flutter doctor
vim .bashrc
flutter doctor
vim .bashrc
flutter doctor
cd opt/android/sdk
ll
rm current
ln -s platform_tools_35.0.1
ln -s platform_tools_35.0.1 current
  
### android tools download:
curl https://dl.google.com/android/repository/tools_r25.2.3-linux.zip
ls
unzip tools_r25.2.3-linux.zip
cd
vim .bashrc
  
### jdk not found error fix:
sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt-get update
sudo apt-get install openjdk-8-jdk

### continuing android sdk location error fix,cmdline-tools missing:  
cd opt/android/sdk/tools
flutter doctor
path/to/sdkmanager --install "cmdline-tools;latest
~/opt/android/sdk --install "cmdline-tools;latest
flutter doctor
  


### commandlinetools download and installation:(cmdline-tools component is missing fix)
ref link:https://linuxopsys.com/install-android-sdk-without-android-studio-on-ubuntu
commandlinetools download link:https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip
cd opt/android/sdk
unzip commandlinetools-linux-11076708_latest.zip 
cd cmdline-tools/
mkdir tools 
mv -i * tools

### required sdk tools installation command:
flutter config --android-sdk="$OPT_DIR/android/sdk"
~/opt/android/sdk/tools/bin/sdkmanager "platform-tools" "platforms;android-30" "build-tools; 30.0.3"
  
### java version missing error:
apt install openjdk-17-jdk openjdk-17-jre
sudo apt install openjdk-17-jdk openjdk-17-jre
  
  
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