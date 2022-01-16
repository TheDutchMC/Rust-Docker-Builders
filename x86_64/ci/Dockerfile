FROM rust:latest
RUN apt update -y && apt install -y \
    gcc \
    musl-tools \
    libssl-dev \
    make

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
RUN ln -s ${HOME}/.cargo/bin/* /usr/local/bin/

RUN rustup toolchain install beta
RUN rustup toolchain install nightly
RUN rustup toolchain install stable

RUN rustup target add x86_64-unknown-linux-musl --toolchain stable
RUN rustup target add x86_64-unknown-linux-musl --toolchain beta
RUN rustup target add x86_64-unknown-linux-musl --toolchain nightly

RUN rustup component add clippy
RUN rustup component add rustfmt
