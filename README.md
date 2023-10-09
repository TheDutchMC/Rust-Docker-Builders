# Rust-Docker-Builders
Collection of Docker images for building Rust for various different targets.

### Supported targets
- x86_64-unknown-linux-gnu (CentOS 7)
- x86_64-unknown-linux-gnu (Ubuntu Xenial)
- x86_64-apple-darwin
- aarch64-unknown-linux-gnu (Ubuntu Xenial)
- aarch64-apple-darwin
- arm-unknown-linux-gnueabihf (Ubuntu Xenial)


CentOS 7 and Ubuntu Xenial are used to ensure glibc compatibility for older targets.  
Once Ubuntu Xenial goes EOL, the next oldest Ubuntu LTS will be used.

### Usage
All of the Docker images here work similarly, pass your input code to `/code/` in the container. So your `Cargo.toml` would be in `/code/Cargo.toml` and your source files in `/code/src/`. If you pass `release` as argument, it will pass `--release` to Cargo, e.g: `docker rust "<path to your code>:/code/ registry.array21.dev/rust-amd64-xenial:latest release` will compile for x86_64 in release mode.

# License
Feel free to use this however you like, open source all the way
