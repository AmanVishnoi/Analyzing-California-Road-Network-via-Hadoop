In the part2
You just need to run the shell script and put the roadnet.txt file in the hdfs directory and every iteration of hadoop will be managed by the shell script itself and rename the file please


It is exactly similar to question number 1 just the difference is that i have assigned weights to edges in reducer.py and again mapper2.py and reducer2.py are run again and again
to process the file

I have used mapper.py to process the entire roadnet.txt file and i have used reducer.py to construct the graph with the vertex
and it's adjeceny list then i have started bfs assuming starting node 0. I have done several iterations and i have found that
the bfs converges when the number of iterations is euqal to the 850. The diameter of the graph. For every iteration I have flushed the output to the local disk and then
that output is input for the next iteration

