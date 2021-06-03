#!/bin/bash

# This script takes two argument, and first is the language code
# second is the type, either release or nightly

lang=$1
type=$2


cd /mnt/data/giella-langs/lang-$lang
git pull

./autogen.sh
./configure --with-hfst --without-xfst --enable-reversed-intersect --enable-fst-hyphenator
make clean
make

mkdir -p /mnt/data/$type
mkdir -p /mnt/data/$type/$lang

cp ./src/analyser-gt-desc.hfstol /mnt/data/$type/$lang
cp ./src/analyser-gt-norm.hfstol /mnt/data/$type/$lang
cp ./src/generator-gt-desc.hfstol /mnt/data/$type/$lang
cp ./src/generator-gt-norm.hfstol /mnt/data/$type/$lang
cp ./src/cg3/disambiguator.bin /mnt/data/$type/$lang
cp ./src/cg3/dependency.bin /mnt/data/$type/$lang
cp ./src/hyphenation/hyphenation.lookup.hfst /mnt/data/$type/$lang
cp ./src/generator-dict-gt-norm.hfst /mnt/data/$type/$lang/generator-dict-gt-norm.hfstol
cp ./AUTHORS /mnt/data/$type/$lang/AUTHORS.txt
cp ./LICENCE /mnt/data/$type/$lang/LICENCE.txt
copy_json ./metadata.json /mnt/data/$type/$lang/metadata.json

cp /mnt/data/nightly-fst-server/directory_listing_php/index.php /mnt/data/$type/$lang
cp -r  /mnt/data/nightly-fst-server/directory_listing_php/resources /mnt/data/$type/$lang

cd /mnt/data/trunk/words/dicts/
rm -f $lang.json
build_dicts $lang /mnt/data/$type/$lang
