# Rust-Docker-Builders
Collection of Dockerfiles & Co for building Rust for various different targets

All of the Docker images here work similarly, pass your input code to `/code/` in the container. So your `Cargo.toml` would be in `/code/Cargo.toml` and your source files in `/code/src/`. If you pass `release` as argument, it will pass `--release` to Cargo, e.g: `docker rust "<path to your code>:/code/ docker-registry.k8s.array21.dev/rust-darwin-builder:latest release`

## Index
- [MacOS (Darwin) x86_64](Darwin)
- [Ubuntu Xenial x86_64](Xenial)

## Copyright
Feel free to use this however you like, open source all the way