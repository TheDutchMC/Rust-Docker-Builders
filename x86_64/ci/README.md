# CI
Image intented for running tests, clippy, fmt etc. This image is supposed to be extended (using Docker's `FROM` directive), or to be used as an image for CI commands.

This image is based on the latest Ubuntu. It bundles the stable, beta and nightly compiler. As well as clippy and rustfmt for those targets.
It also ships the `musl` target for stable, beta and nightly.

Prebuild image:`docker-registry.k8s.array21.dev/rust-base`
