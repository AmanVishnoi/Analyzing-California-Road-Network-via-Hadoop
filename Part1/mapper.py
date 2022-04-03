#!/usr/bin/env python
import sys
# This is just used as a part to read the file
for line in sys.stdin:
    temp = line.split()
    try:
        node = int(temp[0])
        adj = int(temp[1])
        print("{}\t{}".format(node, adj))
    except ValueError:
        continue

