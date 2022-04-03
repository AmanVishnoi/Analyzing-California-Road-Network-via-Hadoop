#!/usr/bin/env python

import sys
import os
current_Node = None

min_dis = float("inf")
big_line = None
for line in sys.stdin:
    if line.isspace():
        continue
    temp = line.split()
    node = int(temp[0])

    if node != current_Node:
        if big_line is not None:
            if min_dis != float("inf"):
                t = big_line.split()
                if min_dis < float(t[1]):
                    s = t[0] + " " + str(min_dis) + " "
                    s += ' '.join(t[2:])
                    print(s)
                else:
                    print(big_line, end="")
            else:
                print(big_line, end="")
        min_dis = float("inf")
        big_line = None
        current_Node = node
        if len(temp) == 2:
            dis = float(temp[1])
            if dis < min_dis:
                min_dis = dis
        else:
            big_line = line
    else:
        if len(temp) == 2:
            dis = float(temp[1])
            if dis < min_dis:
                min_dis = dis
        else:
            big_line = line
