ARG TAG

FROM rust:${TAG}

WORKDIR /src

RUN apk add musl-dev pkgconfig openssl-dev
RUN cargo install cargo-watch
