cd /mnt/data/apertium/apertium-spa
./autogen.sh
make

lt-print -H spa.automorf.bin > spa.automorf.att
hfst-txt2fst -i spa.automorf.att -o spa.automorf.hfst

lt-print -H spa.autogen.bin > spa.autogen.att
hfst-txt2fst -i spa.autogen.att -o spa.autogen.hfst