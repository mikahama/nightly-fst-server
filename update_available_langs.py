#!/usr/bin/python3
import sys
from glob import glob
from mikatools import *
from tinydb import TinyDB

folder = sys.argv[1]

supported_langs = {"dictionary":[], "morph":[], "cg":[]}

for lang_path in glob( os.path.join(folder, "*/")):
	lang = lang_path.split("/")[-2]
	if len(lang) > 3:
		continue
	hfst = glob(os.path.join(lang_path, "*hfstol"))
	if len(hfst) >0:
		supported_langs["morph"].append(lang)
	if os.path.isfile(os.path.join(lang_path, "disambiguator.bin")):
		supported_langs["cg"].append(lang)
	if os.path.isfile(os.path.join(lang_path, "dictionary.json")):
		db =  TinyDB(os.path.join(lang_path, "dictionary.json"))
		if len(db) > 0:
			supported_langs["dictionary"].append(lang)

json_dump(supported_langs, os.path.join(folder, "supported_languages.json"))

