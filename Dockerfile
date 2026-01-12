FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Basic tools
RUN apt-get update && apt-get install -y \
    git \
    cmake \
    ninja-build \
    build-essential \
    python3 \
    clang \
    llvm \
    wget \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt

# Clone OpenCilk
RUN git clone https://github.com/OpenCilk/opencilk-project.git

WORKDIR /opt/opencilk-project

# Build OpenCilk
RUN mkdir build && cd build && \
    cmake -G Ninja \
      -DCMAKE_BUILD_TYPE=Release \
      -DLLVM_ENABLE_PROJECTS="clang;openmp" \
      -DLLVM_TARGETS_TO_BUILD="AArch64;X86" \
      ../llvm && \
    ninja

# Add OpenCilk clang to PATH
ENV PATH="/opt/opencilk-project/build/bin:$PATH"

WORKDIR /workspace
