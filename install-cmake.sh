#!/usr/bin/env bash

set -euo pipefail

# Specify architecture
ARCH="aarch64"

# Determine the latest version of CMake
VERSION=$(curl -s "https://api.github.com/repos/Kitware/CMake/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')

# Download the latest version of CMake
curl -LO "https://github.com/Kitware/CMake/releases/download/v$VERSION/cmake-$VERSION-linux-$ARCH.sh"

# Install the latest version of CMake
chmod +x "cmake-$VERSION-linux-$ARCH.sh"
sudo "./cmake-$VERSION-linux-$ARCH.sh" --skip-license --prefix="/opt/cmake"
export PATH="/opt/cmake/bin:$PATH"

