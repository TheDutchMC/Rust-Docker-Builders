#!/bin/bash
if [ ! -z "$1" ] && [[ "$1" == "release" ]]
then
    cd /code/
    cargo build --lib --release --target arm-unknown-linux-gnueabihf
else 
    cd /code/
    cargo build --lib --target arm-unknown-linux-gnueabihf
fi