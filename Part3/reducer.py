#!/usr/bin/env python

import sys
from datetime import datetime

li = []
random_list = []

current_Node = None
with open("random_list.txt") as file:
    data = file.readlines()
    print(data)
try:
    each_ele = data[0]

except:
    # It means no element is remaining in the list
    exit()
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
            if current_Node == int(each_ele):
                print(current_Node, 0, s)
            else:
                print(current_Node, float("inf"), s)
        current_Node = node
        li = [adj_node]
