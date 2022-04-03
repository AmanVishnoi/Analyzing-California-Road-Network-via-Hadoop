ReadMe of quetion4

Before we start processing our data needs to be in some specific format.

Our input file RoadNet.txt should be processed to give us the following: (node from, node to, Distance between) for this we use prepare.py


cat RoadNet.txt | .prepare.py > data/input.txt

Now we have a file named input.txt in data folder. Now we sinply have to run our shell script "run4.sh"

It has chained multiple map reduce in it.

To use shell script we simply write in terminal:

./run4.sh arg1 arg2

Here arg1=input file name (i.e data/input.txt by default)

arg2= number of iterations ( it should be equal to 849 i.e diameter of the given graph; default =10)

After we specify arg1 and arg2 the output shown in the terminal is (Node, Distance from Source Node, Path).

For more details we can refer to the output.txt that has been generated in data folder.