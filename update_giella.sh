#!/bin/bash

source /mnt/data/.env

cd /mnt/data/trunk
svn up

cd /mnt/data/trunk/giella-core
./autogen.sh
./configure
make

cd /mnt/data/trunk/giella-shared
./autogen.sh
./configure
make


