#!/usr/bin/env python

import sys

for line in sys.stdin:
    if line.isspace():
        continue
    temp = line.split()
    node = int(temp[0])
    dis = float(temp[1])
    adj_list = temp[2:]
    for i in range(0, len(adj_list), 2):
        new_dis = int(adj_list[i+1]) + dis
        print(adj_list[i], new_dis)
    print(line, end="")

