#!/bin/bash

lang=$1
type=$2

cd /mnt/data/apertium/apertium-$lang
git pull

./autogen.sh
make clean
make

mkdir -p /mnt/data/$type
mkdir -p /mnt/data/$type/$lang


cp $lang.automorf.hfst /mnt/data/$type/$lang/analyser-gt-desc.hfstol
cp $lang.automorf.hfst /mnt/data/$type/$lang/analyser-gt-norm.hfstol
cp $lang.autogen.hfst /mnt/data/$type/$lang/generator-gt-norm.hfstol
cp $lang.autogen.hfst /mnt/data/$type/$lang/generator-gt-desc.hfstol
cp COPYING /mnt/data/$type/$lang/COPYING
cp AUTHORS /mnt/data/$type/$lang/AUTHORS

#hfst-invert -i $lang.automorf.hfst -o /mnt/data/$type/$lang/generator-gt-desc.hfstol
#hfst-invert -i $lang.automorf.hfst -o /mnt/data/$type/$lang/generator-gt-norm.hfstol

echo '{"apertium":true, "url":"https://github.com/apertium"}' > /mnt/data/$type/$lang/metadata.json

cp /mnt/data/nightly-fst-server/directory_listing_php/index.php /mnt/data/$type/$lang
cp -r  /mnt/data/nightly-fst-server/directory_listing_php/resources /mnt/data/$type/$lang