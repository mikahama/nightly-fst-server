#!/bin/bash
cd /mnt/data/trunk
svn up

cd /mnt/data/others/giella-core
git pull
./autogen.sh
./configure
make

cd /mnt/data/others/giella-shared
git pull
./autogen.sh
./configure
make


