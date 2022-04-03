You just need to run the shell script only and put roadnet file(renamed) into hdfs directory
In the shell script u can see that i have first run the random_file.py function which is used to genrate 1000 random nodes and store the result as random_nodes.txt in the same directory

Then i just select the first node from the random_node.txt file in the reducer.py and then performed bfs for that particular node and then removed the first line from the file, echo the time taken for bfs, and then in the file i have 999 nodes remaning i did the same thing until the file is empty..
