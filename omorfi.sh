#!/bin/bash
cd /mnt/data/others/omorfi
make clean
git pull
./autogen.sh
export enable_omor_semantics="no"
./configure --enable-giella
make

cp ./src/generated/omorfi-giella.generate.hfst /mnt/data/nightly/fin/generator-gt-norm.hfstol
cp ./src/generated/omorfi-giella.analyse.hfst /mnt/data/nightly/fin/analyser-gt-norm.hfstol

cd /mnt/data/others/lang-fin
make clean
git pull
./autogen.sh
./configure --with-hfst --without-xfst --enable-reversed-intersect --enable-fst-hyphenator
make

cp ./src/analyser-gt-desc.hfstol /mnt/data/nightly/fin
cp ./src/generator-gt-desc.hfstol /mnt/data/nightly/fin
cp ./src/cg3/disambiguator.bin /mnt/data/nightly/fin
cp ./src/cg3/dependency.bin /mnt/data/nightly/fin
cp ./src/hyphenation/hyphenation.lookup.hfst /mnt/data/nightly/fin
cp ./src/generator-dict-gt-norm.hfst /mnt/data/nightly/fin/generator-dict-gt-norm.hfstol
cp ./AUTHORS /mnt/data/nightly/fin/AUTHORS.txt
cp ./LICENCE /mnt/data/nightly/fin/LICENCE.txt
copy_json ./metadata.json /mnt/data/nightly/fin/metadata.json