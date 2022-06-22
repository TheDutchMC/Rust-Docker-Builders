FROM ubuntu:latest
RUN apt update -y && apt install -y -qq --no-install-recommends \
    gcc \
    musl-tools \
    libssl-dev \
    cmake \
    clang \
    make \
    git \
    ca-certificates \
    zlib1g-dev \
    pkg-config \
    python3 \
    curl

# Install the mold linker
RUN git clone https://github.com/rui314/mold.git /usr/src/mold
WORKDIR /usr/src/mold
RUN git checkout v1.2.1
RUN make -j$(nproc) CXX=clang++
RUN make install
WORKDIR /

# Install Rustup
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
RUN ln -s ${HOME}/.cargo/bin/* /usr/local/bin/

# Install all toolchains
RUN rustup toolchain install stable
RUN rustup toolchain install beta

RUN rustup set profile minimal
RUN rustup toolchain install nightly

# Install the musl targets
RUN rustup target add x86_64-unknown-linux-musl --toolchain stable
RUN rustup target add x86_64-unknown-linux-musl --toolchain beta
#RUN rustup target add x86_64-unknown-linux-musl --toolchain nightly

# Install clippy
RUN rustup component add clippy --toolchain stable
RUN rustup component add clippy --toolchain beta
RUN rustup component add clippy --toolchain nightly

# Install rustfmt
RUN rustup component add rustfmt --toolchain stable
RUN rustup component add rustfmt --toolchain beta
RUN rustup component add rustfmt --toolchain nightly

# Configure cargo
COPY ./cargo_config.toml /.cargo/config.toml