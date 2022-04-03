#!/bin/bash
 
startHadoop() {
	hadoop jar /usr/lib/hadoop-mapreduce/hadoop-streaming.jar -file mapper2.py reducer2.py -mapper "python3 mapper2.py" -reducer "python3 reducer2.py" -input /user/aman/data/all.txt -output /user/aman/output
  # hadoop jar ../share/hadoop/tools/lib/hadoop-streaming-3.3.1.jar -input /aman/data/all.txt -output /aman/output -file mapper2.py -mapper "python3 mapper2.py" -file reducer2.py -reducer "python3 reducer2.py"
  # mv output/part-* data/input$i
  # mv output/part-* "data/input$i.dat" 
  pwd
  hdfs dfs -cat /user/aman/output/* > all.txt
  hdfs dfs -put all.txt /user/aman/output/
  rm all.txt
  # hdfs dfs -rm -r /aman/data/part-00000
  hdfs dfs -rm /user/aman/data/all.txt
  hdfs dfs -mv /user/aman/output/all.txt /user/aman/data/
  hdfs dfs -rm -r /user/aman/output/
  echo "Iteration ends"
}
 
main()
{
hdfs dfs -rm -r /user/aman/data/
hdfs dfs -rm -r /user/aman/output/
hadoop jar /usr/lib/hadoop-mapreduce/hadoop-streaming.jar -file mapper.py reducer.py -mapper "python3 mapper.py" -reducer "python3 reducer.py" -input /user/aman/input.txt -output /user/aman/data
 hdfs dfs -cat /user/aman/data/* > all.txt
  hdfs dfs -put all.txt /user/aman/data/
# hadoop jar ../share/hadoop/tools/lib/hadoop-streaming-3.3.1.jar -input /aman/input.txt -output /aman/data -file mapper.py -mapper "python3 mapper.py" -file reducer.py -reducer "python3 reducer.py"
 # hdfs dfs -mv /user/aman/data/part00001 /user/aman/data/all.txt
 for ((i=1; i<=$iterationCount; i++));
  do
     startHadoop $i
     echo "done with iteration $i"
  done
}
 
if [ $# -eq 0 ]
then
  echo "No argument supplied"
  nextInputName="part-00000"
  originalInputName="part-00000"
  iterationCount=850
else
  nextInputName=$1
  originalInputName=$1
  iterationCount=$2
fi
 
main
