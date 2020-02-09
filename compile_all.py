#!/usr/bin/python3
from mikatools import *
from subprocess import call
from glob import glob

langs = [x.split("/")[-2] for x in glob(script_path("trunk/langs/*/"))]
print(langs)

def run_niko(lang):
	call([script_path("compile_language.sh"), lang, "nightly"])

jobs = []
for l in langs:
	jobs.append({"lang":l})
t = WorkerRunner(run_niko, jobs, 2)
t.start()
