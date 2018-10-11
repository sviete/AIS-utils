#!/usr/bin/env bash
#
#   AIS dom Caddy Installer Script
#
#   Homepage: https://ai-speaker.com
#

########################
# Download and extract #
########################

echo "Downloading Caddy for AIS dom"

# Use $PREFIX for compatibility with AIS dom on Android
dl="$PREFIX/tmp/caddy.tar.gz"
rm -rf -- "$dl"

curl -o "$dl" -L https://raw.githubusercontent.com/sviete/AIS-utils/master/caddy/caddy_v0.11.0_linux_arm7.tar.gz


echo "Extracting..."
tar xf "$dl"
chmod +x "$PREFIX/tmp/caddy"


echo "Putting caddy in bin path"
mv "$PREFIX/tmp/caddy" "$PREFIX/bin/caddy"
rm -rf "$dl"

# check installation
caddy -version

echo "Successfully installed"
return 0
