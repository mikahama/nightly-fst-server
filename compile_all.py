#!/usr/bin/python3
from mikatools import *
from subprocess import call
from glob import glob

langs_n = [x.split("/")[-2] for x in glob(script_path("/mnt/data/giella-langs/*/"))]
langs = []
for l in langs_n:
	if "lang-" not in l:
		continue
	langs.append(l.split("-")[1])
protected_langs = ["ara", "swe", "eng"]
print(langs)
langs = list(set(langs) - set(protected_langs))

def run_niko(lang):
	call([script_path("compile_language.sh"), lang, "nightly"])

jobs = []
for l in langs:
	jobs.append({"lang":l})
t = WorkerRunner(run_niko, jobs, 2)
t.start()
