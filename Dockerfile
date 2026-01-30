FROM ubuntu:latest

# Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install build tools & deps
RUN apt update && apt install -y \
    build-essential \
    libgl1-mesa-dev \
    libx11-dev \
    libglu1-mesa-dev \
    nano \
    python3 \
    python3-pip \
    pulseaudio-utils \
    libogg-dev \
    libvorbis-dev \
    libflac-dev \
    libopenal-dev \
    unzip \
    && rm -rf /var/lib/apt/lists/* \
    && pip install cpplint --break-system-packages \
    && pip install PyYAML --break-system-packages

WORKDIR /comp4-grading

COPY . .

ENV LD_LIBRARY_PATH=/comp4-grading/SFML-3.0.2/lib:$LD_LIBRARY_PATH
ENV PKG_CONFIG_PATH=/comp4-grading/SFML-3.0.2/lib/pkgconfig:$PKG_CONFIG_PATH
ENV CPLUS_INCLUDE_PATH=/comp4-grading/SFML-3.0.2/include:$CPLUS_INCLUDE_PATH
ENV LIBRARY_PATH=/comp4-grading/SFML-3.0.2/lib:$LIBRARY_PATH
