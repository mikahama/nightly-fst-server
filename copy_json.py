#!/usr/bin/python3
from mikatools import *
from sys import argv
from os import path

orig = argv[1]
target = argv[2]
print(orig, target)
if not path.exists(orig) and not path.exists(target):
	d = {"info":"take a look at UralicNLP model catalogue...\n\nFor people developing this resource, include a metadata.json to your repository to change this message."}
else:
	d = json_load(orig)
json_dump(d, target)
