FROM ubuntu:focal
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    make \
    gcc \
    g++ \
    clang \
    zlib1g-dev \
    libmpc-dev \
    libmpfr-dev \
    libgmp-dev \
    liblzma-dev \
    libxml2-dev \
    libssl-dev \
    libbz2-dev \
    curl \
    wget \
    git \
    cmake \
    xz-utils \
    lzma-dev \
    python3 \
    cpio \
    python3-pip
RUN pip3 install gdown

# Clone osxcross
RUN mkdir -p /tmp/osxcross
RUN git clone https://github.com/tpoechtrager/osxcross.git /tmp/osxcross

# https://drive.google.com/file/d/1a7_pzEYlUlFrFO46bSXxdBRF-50Ooa-L/view?usp=sharing
# Download the Xcode tools
RUN mkdir -p /tmp/xcode
RUN gdown https://drive.google.com/uc?id=1a7_pzEYlUlFrFO46bSXxdBRF-50Ooa-L -O /tmp/xcode/xcode-command-line-tools.dmg

# Package the SDK
WORKDIR /tmp/osxcross
RUN ./tools/gen_sdk_package_tools_dmg.sh /tmp/xcode/xcode-command-line-tools.dmg
RUN cp MacOSX11.3.sdk.tar.xz /tmp/osxcross/tarballs

# Build osxcross
ENV OCDEBUG=1
ENV UNATTENDED=1
RUN ./build.sh
WORKDIR /

# Copy to PATH
RUN mkdir -p /usr/local/osx/
RUN cp -r /tmp/osxcross/target/* /usr/local/osx

# Cleanup
RUN rm -rf /tmp/xcode /tmp/osxcross

# Install Rust tools
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
RUN ln -s ${HOME}/.cargo/bin/* /usr/local/bin/
RUN rustup toolchain install nightly
RUN rustup default stable

WORKDIR /