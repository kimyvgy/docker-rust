# docker-rust
Container for Rust development environment.

This already installed: `musl-dev`, `openssl-dev`, `pkgconfig`, `cargo-watch`.

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
