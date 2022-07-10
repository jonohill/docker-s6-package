#!/usr/bin/env sh

set -e

case "${TARGETPLATFORM}" in
        "linux/arm64")
            s6_arch=aarch64
            ;;
        "linux/arm/v7")
            s6_arch=armhf
            ;;
        "linux/386")
            s6_arch=i686
            ;;
        "linux/riscv64")
            s6_arch=riscv64
            ;;
        "linux/s390x")
            s6_arch=s390x
            ;;
        "linux/amd64")
            s6_arch=x86_64
            ;;
        *)
            echo "Unsupported target platform ${TARGETPLATFORM}"
            ;;
esac

base_url="https://github.com/just-containers/s6-overlay/releases/download/$S6_VERSION"

mkdir /s6root

set -- \
    s6-overlay-noarch.tar.xz \
    "s6-overlay-$s6_arch.tar.xz" \
    s6-overlay-symlinks-noarch.tar.xz \
    s6-overlay-symlinks-arch.tar.xz
for f in "$@"; do
    curl -fL -o "/tmp/$f" "$base_url/$f"
    tar -C /s6root/ -Jxpf "/tmp/$f"
done
