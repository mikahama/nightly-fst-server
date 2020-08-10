#!/bin/bash
cd /mnt/data/others/omorfi
make clean
git pull
./autogen.sh
export enable_omor_semantics="no"
./configure --enable-giella
make

cp ./src/generated/omorfi-giella.generate.hfst /mnt/data/nightly/fin/generator-dict-gt-norm.hfstol
#cp ./src/generated/omorfi-giella.analyse.hfst /mnt/data/nightly/fin/analyser-gt-norm.hfstol
