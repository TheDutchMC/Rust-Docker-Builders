FROM centos:7

RUN yum -y install \
    gcc \
    curl \
    wget \
    openssl-devel \
    pkgconfig

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
RUN ln -s ${HOME}/.cargo/bin/* /usr/local/bin/
RUN rustup toolchain install stable-x86_64-unknown-linux-gnu
RUN rustup target add x86_64-unknown-linux-gnu

COPY ./build.sh /build.sh
RUN chmod +x /build.sh

ENTRYPOINT ["/build.sh"]