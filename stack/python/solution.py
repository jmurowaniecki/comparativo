#!/usr/bin/env python

import sys
import hashlib
from io import open

fail = []

with open(sys.argv[1], "r") as f:
    while f:
        line = f.readline()
        if not line:
            break
        data, hash, tail = line.split(' ', 2)
        check = hashlib.md5(data.encode('utf-8')).hexdigest()
        if check != hash:
            fail.append("%s %s" % (data, hash))

print ("\n".join(fail))
