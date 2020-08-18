#!/usr/bin/env python3

import sys, subprocess

args = sys.argv[1]
path = args.split("/")
if len(path) > 1 and path[1] == '':
    path.pop()
if path[0] == "":
    path = "/".join(path)

if len(path) == 1:
    perms = "stat -c '%U|%G' ."
else:
    perms = "stat -c '%U|%G' {}".format(path[0])

path = "/".join(path)
call = "mkdir {}".format(path)
tag = "echo 'It me' > {}/Jeremy".format(path)

try:
    checkPerms = str(subprocess.check_output(perms, shell=True))[2:-1]
    createFolder = str(subprocess.check_output(call, shell=True))[2:-1]
    if "jeremy" in checkPerms:
        createTag = str(subprocess.check_output(tag, shell=True))[2:-1]
except:
    pass
