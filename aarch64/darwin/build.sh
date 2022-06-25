#!/bin/bash

# Configure environment
export CXX=/usr/local/osx/bin/oa64-clang++
export CC=/usr/local/osx/bin/oa64-clang
export LIBZ_SYS_STATIC=1
export PKG_CONFIG_ALLOW_CROSS=1
export PATH=/usr/local/osx/bin:${PATH}
export LD_LIBRARY_PATH=/usr/local/osx/lib:${LD_LIBRARY_PATH}

if [ ! -z "$1" ] && [[ "$1" == "release" ]]
then
    cd /code/
    cargo +nightly -Z sparse-registry build --release --target aarch64-apple-darwin
else 
    cd /code/
    cargo +nightly -Z sparse-registry build --target aarch64-apple-darwin
fi