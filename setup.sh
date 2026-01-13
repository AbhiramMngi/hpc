#!/usr/bin/env bash
set -e

echo "============================================"
echo "  Ubuntu Dev + Perf Environment Setup"
echo "============================================"

echo "[1/9] Updating system..."
sudo apt update && sudo apt upgrade -y

echo "[2/9] Installing core build tools..."
sudo apt install -y build-essential make cmake ninja-build pkg-config

echo "[3/9] Installing clang / llvm toolchain..."
sudo apt install -y clang llvm lldb lld

echo "[4/9] Installing ccache..."
sudo apt install -y ccache

echo "[5/9] Installing perf + performance tools..."
sudo apt install -y linux-tools-common linux-tools-generic \
                    htop sysstat strace ltrace

echo "[6/9] Installing GENERIC kernel (fixes perf on AWS)..."
sudo apt install -y linux-image-generic linux-headers-generic

echo "[7/9] Setting clang as default compiler..."
sudo update-alternatives --install /usr/bin/cc cc /usr/bin/clang 100
sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++ 100

echo "[8/9] Updating ~/.bashrc with toolchain config..."

# Avoid duplicate entries
grep -qxF 'export CC=clang' ~/.bashrc || echo 'export CC=clang' >> ~/.bashrc
grep -qxF 'export CXX=clang++' ~/.bashrc || echo 'export CXX=clang++' >> ~/.bashrc
grep -qxF 'export CXXFLAGS="-std=c++20"' ~/.bashrc || echo 'export CXXFLAGS="-std=c++20"' >> ~/.bashrc
grep -qxF 'export CMAKE_C_COMPILER=clang' ~/.bashrc || echo 'export CMAKE_C_COMPILER=clang' >> ~/.bashrc
grep -qxF 'export CMAKE_CXX_COMPILER=clang++' ~/.bashrc || echo 'export CMAKE_CXX_COMPILER=clang++' >> ~/.bashrc
grep -qxF 'export PATH="/usr/lib/ccache:$PATH"' ~/.bashrc || echo 'export PATH="/usr/lib/ccache:$PATH"' >> ~/.bashrc

echo "[9/9] Reloading bashrc..."
source ~/.bashrc

echo "============================================"
echo " Setup complete."
echo " IMPORTANT: You MUST reboot for the generic"
echo " kernel to take effect so that perf works."
echo "============================================"
echo "Run: sudo reboot"
