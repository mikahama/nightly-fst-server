#!/usr/bin/python3
import xmltodict
from mikatools import *
import glob
from tinydb import TinyDB, Query
from tinydb.middlewares import CachingMiddleware
from collections import OrderedDict
import shutil
import os
import sys


def convert_xml(path):
	xml = open_read(path).read()
	o = xmltodict.parse(xml)
	return o["r"]["e"]

def merge_xmls(path, r):
	for f in glob.glob(path+ "src/*.xml"):
		print(f)
		r.extend(convert_xml(f))
	return r

def update_db(paths, lang):
	r = []
	for path in paths:
		print(path)
		r = merge_xmls(path, r)
		print(len(r))
	r = list(filter(lambda x: isinstance(x, OrderedDict) ,r))
	with TinyDB(lang + '.json') as db:
		db.insert_multiple(r)


lang = sys.argv[1]
target_path = sys.argv[2]


paths = list(filter(lambda x: x.split("/")[-2].startswith(lang), glob.glob("./*/")))

update_db(paths, lang)
shutil.copyfile(lang + '.json', os.path.join(target_path, "dictionary.json"))