FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive

# Install build dependencies
RUN apt-get clean \
    && apt-get update \
    && apt-get -y install --no-install-recommends \
    build-essential \
    cmake \
    git \
    pkg-config \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

# Install dependencies
RUN apt-get update \
    && apt-get -y install --no-install-recommends \
    libeigen3-dev \
    libassimp-dev \
    libccd-dev \
    libfcl-dev \
    libboost-all-dev \
    libnlopt-cxx-dev \
    coinor-libipopt-dev \
    libbullet-dev \
    liblz4-dev \
    libode-dev \
    liboctomap-dev \
    libflann-dev \
    libtinyxml2-dev \
    liburdfdom-dev \
    libxi-dev \
    libxmu-dev \
    freeglut3-dev \
    libopenscenegraph-dev \
    && rm -rf /var/lib/apt/lists/*

# Compile and install DART and dartpy
COPY . /opt/dart
WORKDIR /opt/dart
RUN cd /opt/dart \
    && mkdir build \
    && cd build \
    && cmake \
    -DCMAKE_INSTALL_PREFIX=/usr/ \
    -DCMAKE_BUILD_TYPE=Release .. \
    -DBUILD_SHARED_LIBS=ON \
    -DDART_BUILD_DARTPY=ON \
    && make -j \
    && make install \
    && make -j dartpy \
    && make install-dartpy

WORKDIR "/"
