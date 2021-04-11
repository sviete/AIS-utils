#
#   AIS dom
#
#   Homepage: https://ai-speaker.com
#
################################################
#  Add hacs script
#  run it by executiong in AIS dom console:
#  curl https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/install_hacs.sh | bash
#
################################################
set -e

echo "-----------------------------"
echo $(date '+%Y %b %d %H:%M')
echo "----ADD ZIGBEE FRONTEND START ----"
echo "-----------------------------"

RED_COLOR='\033[0;31m'
GREEN_COLOR='\033[0;32m'
GREEN_YELLOW='\033[1;33m'
NO_COLOR='\033[0m'

haPath='/data/data/pl.sviete.dom/files/home/AIS'

function info () { echo -e "${GREEN_COLOR}INFO: $1${NO_COLOR}";}
function warn () { echo -e "${GREEN_YELLOW}WARN: $1${NO_COLOR}";}
function error () { echo -e "${RED_COLOR}ERROR: $1${NO_COLOR}"; if [ "$2" != "false" ]; then exit 1;fi; }


if [ -n "$haPath" ]; then
    info "Found AIS configuration directory at '$haPath'"
    cd "$haPath" || error "Could not change path to $haPath"
    if [ ! -d "$haPath/custom_components" ]; then
        info "Creating custom_components directory..."
        mkdir "$haPath/custom_components"
    fi

    info "Changing to the custom_components directory..."
    cd "$haPath/custom_components" || error "Could not change path to $haPath/custom_components"

    info "Downloading HACS"
    curl -L "https://github.com/hacs/integration/releases/latest/download/hacs.zip" -o hacs.zip

    if [ -d "$haPath/custom_components/hacs" ]; then
        warn "HACS directory already exist, cleaning up..."
        rm -R "$haPath/custom_components/hacs"
    fi

    info "Creating HACS directory..."
    mkdir "$haPath/custom_components/hacs"

    info "Unpacking HACS..."
    unzip "$haPath/custom_components/hacs.zip" -d "$haPath/custom_components/hacs"

    info "Removing HACS zip file..."
    rm "$haPath/custom_components/hacs.zip"
    info "Installation complete."
    echo
    info "Remember to restart AIS service before you configure hacs. Use command: pm2 restart ais"

else
    echo
    error "Could not find the directory for AIS" false
    echo "Manually change the directory to the root of your AIS configuration"
    echo "With the user that is running AIS"
    echo "and run the script again"
    exit 1
fi
