#!/usr/bin/python3
from mikatools import *
from sys import argv

orig = argv[1]
target = argv[2]
print(orig, target)
d = json_load(orig)
json_dump(d, target)