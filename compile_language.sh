#!/bin/bash

# This script takes two argument, and first is the language code
# second is the type, either release or nightly

lang=$1
type=$2

export GTLANG_$lang=/mnt/data/trunk/langs/$lang
source /mnt/data/.env
cd /mnt/data/trunk/langs/$lang
make clean
./autogen.sh
./configure --with-hfst --without-xfst --enable-reversed-intersect
make
make install

# Should we remove everything?
# rm -f /mnt/data/$type/$lang

mkdir -p /mnt/data/$type
mkdir -p /mnt/data/$type/$lang

cp ./src/analyser-gt-desc.hfstol /mnt/data/$type/$lang
cp ./src/analyser-gt-norm.hfstol /mnt/data/$type/$lang
cp ./src/generator-gt-desc.hfstol /mnt/data/$type/$lang
cp ./src/generator-gt-norm.hfstol /mnt/data/$type/$lang
cp ./src/generator-dict-gt-norm.hfstol /mnt/data/$type/$lang

cp /mnt/data/nightly-fst-server/directory_listing_php/index.php /mnt/data/$type/$lang
cp -r  /mnt/data/nightly-fst-server/directory_listing_php/resources /mnt/data/$type/$lang
