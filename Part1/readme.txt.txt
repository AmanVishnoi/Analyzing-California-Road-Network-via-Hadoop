In the part1
You just need to run the shell script and put the roadnet.txt file in the hdfs directory and every iteration of hadoop will be managed by the shell script itself and please rename the
file as input.txt and change the configuration for your pc hadoop i.e. username/output folder for shell script.



I have used mapper.py to process the entire roadnet.txt file and i have used reducer.py to construct the graph with the vertex
and it's adjeceny list then i have started bfs assuming starting node 0. I have done several iterations and i have found that
the bfs converges when the number of iterations is euqal to the 850. The diameter of the graph. For every iteration I have flushed the output to the local disk and then
that output is input for the next iteration
