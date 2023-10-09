#!/bin/bash
if [ ! -z "$1" ] && [[ "$1" == "release" ]]
then
    cd /code/
    cargo +nightly -Z sparse-registry build --release --target arm-unknown-linux-gnueabihf
else 
    cd /code/
    cargo +nightly -Z sparse-registry build --target arm-unknown-linux-gnueabihf
fi