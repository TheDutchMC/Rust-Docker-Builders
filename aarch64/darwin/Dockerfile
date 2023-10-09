FROM registry.array21.dev/rust-generic-darwin

# Install Rust
RUN rustup target add aarch64-apple-darwin --toolchain nightly
COPY cargo_config /root/.cargo/config

# Copy runtime files
COPY ./build.sh /build.sh
RUN chmod +x /build.sh

ENTRYPOINT ["/build.sh"]