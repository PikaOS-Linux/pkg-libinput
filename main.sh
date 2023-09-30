#! /bin/bash

DEBIAN_FRONTEND=noninteractive

# Clone Upstream
wget -nv https://gitlab.freedesktop.org/libinput/libinput/-/archive/1.24.0/libinput-1.24.0.tar.gz
tar -xf ./libinput-1.24.0.tar.gz
mkdir -p ./libinput-1.24.0
cp -rvf ./debian ./libinput-1.24.0/
cd ./libinput-1.24.0/

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
