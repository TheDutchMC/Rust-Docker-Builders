#!/bin/bash
if [ ! -z "$1" ] && [[ "$1" == "release" ]]
then
    cd /code/
    CXX=/usr/local/osx-ndk-x86/bin/o64-clang++ CC=/usr/local/osx-ndk-x86/bin/o64-clang LIBZ_SYS_STATIC=1 PKG_CONFIG_ALLOW_CROSS=1 cargo build --lib --release --target x86_64-apple-darwin
else 
    cd /code/
    CXX=/usr/local/osx-ndk-x86/bin/o64-clang++ CC=/usr/local/osx-ndk-x86/bin/o64-clang LIBZ_SYS_STATIC=1 PKG_CONFIG_ALLOW_CROSS=1 cargo build --lib --target x86_64-apple-darwin
fi