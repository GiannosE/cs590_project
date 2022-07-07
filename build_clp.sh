#!/bin/bash

sudo apt update -y && sudo apt upgrade -y
git clone https://github.com/y-scope/clp.git
cd clp/components/core
tools/scripts/deps-download/download-all.sh
sudo apt-get install -y ca-certificates checkinstall cmake curl build-essential \
  libboost-filesystem-dev libboost-iostreams-dev libboost-program-options-dev \
  libssl-dev pkg-config rsync zlib1g-dev
./tools/scripts/lib_install/fmtlib.sh 8.0.1
./tools/scripts/lib_install/libarchive.sh 3.5.1
./tools/scripts/lib_install/lz4.sh 1.8.2
./tools/scripts/lib_install/mariadb-connector-c.sh 3.2.3
./tools/scripts/lib_install/spdlog.sh 1.9.2
./tools/scripts/lib_install/zstandard.sh 1.4.9
mkdir build
cd build
cmake ../
make
