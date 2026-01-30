FROM ubuntu:latest

# Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install build tools & deps
RUN apt update && apt install -y \
    build-essential \
    xwayland \
    libgl1-mesa-dev \
    libx11-dev \
    libglu1-mesa-dev \
    nano

COPY . /

ENV LD_LIBRARY_PATH=/SFML-3.0.2/lib:$LD_LIBRARY_PATH
ENV PKG_CONFIG_PATH=/SFML-3.0.2/lib/pkgconfig:$PKG_CONFIG_PATH
