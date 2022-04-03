#!/usr/bin/env python3

import sys

infini = 9999
pointsTo = ''
currentNode = None
startNode = "0"
nodes = []
neighbors = []

def emit():
	dist = infini
	if currentNode == startNode:
		dist = 0
	nodes.append(currentNode)
	print(currentNode + ' ' + str(dist) + ' ' + pointsTo)

def addNeighbor(neighbor):
	added = False
	for i in range(len(neighbors)):
		if neighbor == neighbors[i]:
			added = True
	if added == False:
		neighbors.append(neighbor)

for line in sys.stdin:
	lineValues = line.strip().split('\t')
	nid = lineValues[0]
	neighbor = lineValues[1]
	distance = 1
	if currentNode != None:
		if currentNode != nid:
			emit()
			pointsTo = ''
			currentNode = nid
	else:
		currentNode = nid
	addNeighbor(neighbor)
	pointsTo = pointsTo + neighbor + ',' + str(distance) + ':'

emit()

for i in range(len(neighbors)):
	found = False
	for x in range(len(nodes)):
		if nodes[x] == neighbors[i]:
			found = True
	if found == False:
		nodes.append(neighbors[i])
		dist = infini
		if neighbors[i] == startNode:
			dist = 0
		print(neighbors[i]+ ' ' + str(dist) + ' ')
