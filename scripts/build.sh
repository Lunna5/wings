#!/usr/bin/env bash

git submodule update --init && ./scripts/applyPatches.sh || exit 1

if [ "$1" == "--pkg" ]; then
    cd wings-dev
    go build || {
        echo "Failed to build the package"
        echo "Do you have the Go programming language installed?"
        echo "Please check the error message above"
        exit 1
    }
fi