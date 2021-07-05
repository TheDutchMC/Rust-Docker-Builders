#!/bin/bash
if [ ! -z "$1" ] && [[ "$1" == "release" ]]
then
    cd /code/
    cargo build --lib --release --target x86_64-unknown-linux-gnu
else 
    cd /code/
    cargo build --lib --target x86_64-unknown-linux-gnu
fi