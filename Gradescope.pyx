#!/usr/bin/python3
# Usage: python3 Gradescope.py [zip archive]
# Extracts all student submissions from the archive into the directory,
# and puts each submission into their own subdirectory

import os, sys
import shutil
import yaml
import zipfile

zipfilename = sys.argv[1]
zipname = os.path.splitext(zipfilename)[0]

resourcename = f'resources-{zipname}'

with zipfile.ZipFile(zipfilename) as zf:
    #zf.printdir()
    metainfo = [info for info in zf.infolist() if 'submission_metadata.yml' in info.filename][0]
    print(metainfo.filename)
    with zf.open(metainfo) as metafile:
        meta = yaml.safe_load(metafile)
        subnames = {}
        for num, submission in meta.items():
            name = (submission[':submitters'][0][':name']).replace(' ', '-')
            pathname = os.path.join(zipname, name)
            subnames[num] = pathname
    for info in zf.infolist():
        if info.is_dir() or 'submission_metadata.yml' in info.filename:
            continue
        parts = info.filename.split('/')
        submitter = subnames[parts[1]]
        submission = parts[2:]
        info.filename = os.path.join(submitter, *submission)
        zf.extract(info)
    # Copy resources
    if os.path.isdir(resourcename):
        for name in subnames.values():
            dest = os.path.join(name, zipname)
            shutil.copytree(resourcename, dest, dirs_exist_ok=True)
            # for fname in os.listdir(resourcename):
                # shutil.copy2(os.path.join(resourcename, fname), os.path.join(dest))

