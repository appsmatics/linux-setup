# export the env variables defined here
# run the scripts as follows:
# (source ~/projects/github/appsmatics/linux-setup/installs/versions.sh; ~/projects/github/appsmatics/linux-setup/installs/flutter.sh)

OS=$(uname -s)
REQUIRED_OS="linux"
if [ $OS = "Darwin" ]; then
  REQUIRED_OS=mac
fi

set -a

DEST_DIR="/opt2"


# Flutter 
FLUTTER_VERSION="3.24.3"
ANDROID_VERSION="34"
BUILD_TOOLS_VERSION="34.0.0"


CMDLINE_TOOLS_URL="https://dl.google.com/android/repository/commandlinetools-${REQUIRED_OS}-11076708_latest.zip"

CMDLINE_TOOLS_ZIP=commandlinetools-${REQUIRED_OS}-11076708_latest.zip

set +a
