#!/bin/bash

# Configure environment
set CXX=/usr/local/osx/bin/oa64-clang++
set CC=/usr/local/osx/bin/oa64-clang
set LIBZ_SYS_STATIC=1
set PKG_CONFIG_ALLOW_CROSS=1
set PATH=/usr/local/osx/bin:${PATH}
set LD_LIBRARY_PATH=/usr/local/osx/lib:${LD_LIBRARY_PATH}

if [ ! -z "$1" ] && [[ "$1" == "release" ]]
then
    cd /code/
    cargo +nightly -Z sparse-registry build --release --target aarch64-apple-darwin
else 
    cd /code/
    cargo +nightly -Z sparse-registry build --target aarch64-apple-darwin
fi