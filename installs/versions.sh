# export the env variables defined here
# run the scripts as follows:
# (source ~/projects/github/appsmatics/linux-setup/installs/versions.sh; ~/projects/github/appsmatics/linux-setup/installs/flutter.sh)
set -a

OS=$(uname -s)
REQUIRED_OS="linux"
REQUIRED_JAVA_OS="linux"
if [[ $OS == "Darwin" ]]; then
  REQUIRED_OS=mac
  REQUIRED_JAVA_OS="macos"
fi

DEST_DIR="/opt3"


# Flutter 
FLUTTER_VERSION="3.27.3"
ANDROID_VERSION="34"
BUILD_TOOLS_VERSION="34.0.0"
MIN_REQUIRED_JDK_VERSION=17
JAVA_JDK_DOWNLOAD_VERSION="17"

JAVA_JDK_TAR_VERSION="17.0.12"

# https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.tar.gz

if [[ $REQUIRED_OS == 'mac' ]]; then
  ## macos jdk tar file version number different 17 -> 17.0.12, 21 -> 21.0.4, 23 -> 23
  # https://download.oracle.com/java/17/latest/jdk-17_macos-x64_bin.tar.gz
  # https://download.oracle.com/java/17/latest/jdk-17_macos-aarch64_bin.tar.gz
  JAVA_JDK_TAR_VERSION="17.0.12"

fi

CMDLINE_TOOLS_URL="https://dl.google.com/android/repository/commandlinetools-${REQUIRED_OS}-11076708_latest.zip"

CMDLINE_TOOLS_ZIP=commandlinetools-${REQUIRED_OS}-11076708_latest.zip

JAVA_JDK_URL=https://download.oracle.com/java/${JAVA_JDK_DOWNLOAD_VERSION}/latest/jdk-${JAVA_JDK_DOWNLOAD_VERSION}_${REQUIRED_JAVA_OS}-x64_bin.tar.gz

JAVA_JDK_TAR_FILE=jdk-${JAVA_JDK_TAR_VERSION}_$REQUIRED_JAVA_OS-x64_bin.tar.gz

set +a
