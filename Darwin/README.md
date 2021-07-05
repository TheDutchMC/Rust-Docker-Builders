# Apple Darwin 
Builder image for Apple (Darwin) builds. This image exists to avoid having to compile [osxcross](https://github.com/tpoechtrager/osxcross) every time you need your CI doing anything.
The image is available at `docker-registry.k8s.array21.dev/rust-darwin-builder`

## Usage
`docker run -v "<Path to your code>:/code/" docker-registry.k8s.array21.dev/rust-darwin-builder`  
See [Root README for more details](../)
