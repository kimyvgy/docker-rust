# docker-rust
Container for Rust development environment.

This already installed: `musl-dev`, `openssl-dev`, `pkgconfig`, `cargo-watch`.

## Usage

```yaml
version: '3.6'

services:
  rust:
    image: kimyvgy/rust:1.58-alpine
    tty: true
    working_dir: /src
    volumes:
      - ${PATH_RUST}:/src
```

```sh
docker-compose up -d
docker exec -it rust sh
```

## Build image for a specific version

```
make TAG="1.58-alpine 1.59-alpine"
```
