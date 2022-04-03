#!/usr/bin/env python

import sys

li = []
current_Node = None
for line in sys.stdin:
    temp = line.split()
    # Node , Adj list
    node = int(temp[0])
    adj_node = int(temp[1])
    if node == current_Node:
        li.append(adj_node)
    else:
        if current_Node is not None:
            s = ""
            for adjNodes in li:
                distance = ((int(current_Node) + int(adjNodes)) % 20) + 1
                s += str(adjNodes) + " " + str(distance) + " "
            if current_Node == 0:
                print(0, 0, s)
            else:
                print(current_Node, float("inf"), s)
        current_Node = node
        li = [adj_node]
