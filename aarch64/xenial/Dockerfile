FROM ubuntu:xenial
ENV DEBIAN_FRONTEND=noninteractive

# Change APT depos
RUN sed -i 's|deb http://archive.ubuntu.com/ubuntu/|deb [arch=amd64] http://archive.ubuntu.com/ubuntu/|' /etc/apt/sources.list
RUN sed -i 's|deb http://security.ubuntu.com/ubuntu|deb [arch=amd64] http://security.ubuntu.com/ubuntu|' /etc/apt/sources.list
RUN echo "deb [arch=arm64,armhf] http://ports.ubuntu.com/ubuntu-ports xenial main restricted" >> /etc/apt/sources.list.d/arm.list 
RUN echo "deb [arch=arm64,armhf] http://ports.ubuntu.com/ubuntu-ports xenial-updates main restricted" >> /etc/apt/sources.list.d/arm.list
RUN echo "deb [arch=arm64,armhf] http://ports.ubuntu.com/ubuntu-ports xenial universe" >> /etc/apt/sources.list.d/arm.list
RUN echo "deb [arch=arm64,armhf] http://ports.ubuntu.com/ubuntu-ports xenial-updates universe" >> /etc/apt/sources.list.d/arm.list
RUN echo "deb [arch=arm64,armhf] http://ports.ubuntu.com/ubuntu-ports xenial multiverse"  >> /etc/apt/sources.list.d/arm.list
RUN echo "deb [arch=arm64,armhf] http://ports.ubuntu.com/ubuntu-ports xenial-updates multiverse" >> /etc/apt/sources.list.d/arm.list
RUN echo "deb [arch=arm64,armhf] http://ports.ubuntu.com/ubuntu-ports xenial-backports main restricted universe multiverse" >> /etc/apt/sources.list.d/arm.list

# add aarch64 (i.e arm64) arch
RUN dpkg --add-architecture arm64

RUN apt update -y && apt install -y \
    gcc \
    curl \
    wget \
    libssl-dev \
    pkg-config \
    gcc-aarch64-linux-gnu \
    libssl-dev:arm64

# Install Rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
RUN ln -s ${HOME}/.cargo/bin/* /usr/local/bin/
RUN rustup target add aarch64-unknown-linux-gnu

COPY cargo_config /root/.cargo/config

ENV PKG_CONFIG_SYSROOT_DIR=/usr/lib/aarch64-linux-gnu/

COPY ./build.sh /build.sh
RUN chmod +x /build.sh

ENTRYPOINT ["/build.sh"]