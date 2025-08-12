#!/bin/sh

set -e
mkdir output
git clone https://github.com/ozkl/doomgeneric
cd doomgeneric
git apply ../patches/0001-Add_ethereal_support.patch
cd doomgeneric
make all
cp doomgeneric ../../output/
cd ../../
