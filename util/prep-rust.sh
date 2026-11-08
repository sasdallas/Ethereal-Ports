#!/usr/bin/env bash

set -eu
rustup toolchain install nightly
rustup component add rust-src --toolchain nightly
