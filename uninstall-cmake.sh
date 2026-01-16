#!/usr/bin/env bash

# Check if CMake is already uninstalled
if [ ! -e "/opt/cmake" && ! -e "/etc/profile.d/cmake-bin-path.sh"]; then
    echo "CMake is already uninstalled"
    exit 0
fi

# Uninstall CMake
sudo rm -rf "/opt/cmake"
sudo rm -f "/etc/profile.d/cmake-bin-path.sh"

# Let the user know that CMake was successfully uninstalled
echo "Successfully uninstalled CMake"
