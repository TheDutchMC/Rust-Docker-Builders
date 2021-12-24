# Xenial
Builder image for Centos 7. This image exists to allow backwards glibc compatibility with older versions, by linking to an older version.
The image is available at `docker-registry.k8s.array21.dev/rust-amd64-centos7`

## Usage
`docker run -v "<Path to your code>:/code/" docker-registry.k8s.array21.dev/rust-amd64-centos7`  
See [Root README for more details](https://github.com/TheDutchMC/Rust-Docker-Builders)
