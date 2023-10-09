FROM registry.array21.dev/rust-generic-darwin

# Install Rust target
RUN rustup target add x86_64-apple-darwin --toolchain nightly
COPY cargo_config /root/.cargo/config

# Include build script
COPY ./build.sh /build.sh
RUN chmod +x /build.sh

ENTRYPOINT ["/build.sh"]