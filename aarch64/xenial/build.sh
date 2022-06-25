#!/bin/bash
if [ ! -z "$1" ] && [[ "$1" == "release" ]]
then
    cd /code/
    cargo build --lib --release --target aarch64-unknown-linux-gnu
else 
    cd /code/
    cargo build --lib --target aarch64-unknown-linux-gnu
fi