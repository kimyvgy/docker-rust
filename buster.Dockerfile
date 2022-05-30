ARG TAG

FROM rust:${TAG}

WORKDIR /src

RUN apt update && apt install musl-dev pkg-config libssl-dev -y
RUN cargo install cargo-watch
