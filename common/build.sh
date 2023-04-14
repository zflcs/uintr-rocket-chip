#!/bin/bash

ROOT="$(builtin cd ..; pwd)"

set -e

function build_modules {
    MOD="$ROOT/$1"
    shift
    echo
    if [ -e "$MOD/build" ]
    then
        echo "Removing existing $MOD/build directory"
        rm -rf "$MOD/build"
    fi
    if [ ! -e "$MOD/configure" ]
    then
        echo "No ./configure found"
        cd "$MOD"
        find . -iname configure.ac | sed s/configure.ac/m4/ | xargs mkdir -p
        autoreconf -i
    fi
    mkdir -p "$MOD/build"
    cd "$MOD/build"
    echo "Configuring $MOD"
    ../configure $* > build.log
    echo "Building $MOD"
    make -j $(nproc) >> build.log
    echo "Installing $MOD"
    make install >> build.log
    cd - > /dev/null
}

echo "Starting Rocket Chip Tools build process"

if [ ! $(command -v riscv64-unknown-elf-gcc) ]
then
    echo "RISC-V Toolchain could not be found!"
    exit
fi

build_modules spike --prefix=$RISCV
CC= CXX= build_modules tests --prefix=$RISCV/riscv64-unknown-elf

echo -e "\\Rocket Chip Tools installation completed!"