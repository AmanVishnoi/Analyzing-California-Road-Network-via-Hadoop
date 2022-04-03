#!/bin/bash
 
startHadoop() {
  hadoop jar ../share/hadoop/tools/lib/hadoop-streaming-3.3.1.jar -input /aman/data/all.txt -output /aman/output -file mapper2.py -mapper "python3 mapper2.py" -file reducer2.py -reducer "python3 reducer2.py"
  # mv output/part-* data/input$i
  # mv output/part-* "data/input$i.dat" 
  pwd
  hdfs dfs -cat /aman/output/* > all.txt
  hdfs dfs -put all.txt /aman/output/
  rm all.txt
  # hdfs dfs -rm -r /aman/data/part-00000
  hdfs dfs -rm /aman/data/all.txt
  hdfs dfs -mv /aman/output/all.txt /aman/data/
  hdfs dfs -rm -r /aman/output/
  echo "Iteration ends"
}
 
main()
{
python3 random_file.py
 hadoop jar ../share/hadoop/tools/lib/hadoop-streaming-3.3.1.jar -input /aman/input.txt -output /aman/data -file mapper.py -mapper "python3 mapper.py" -file reducer.py -reducer "python3 reducer.py"
 hdfs dfs -mv /aman/data/part-00000 /aman/data/all.txt
 for ((j=1; j<=999;j++));
  do
    hdfs dfs -rm -r /aman/data/
    hdfs dfs -rm -r /aman/output/
    START=$(date +%s)
   # shellcheck disable=SC2004
   for ((i=1; i<=$iterationCount; i++));
    do
       startHadoop $i
       echo "done with iteration $i"
    done
    sed '1d' random_list.txt
    END=$(date +%s)
    # shellcheck disable=SC2004
    DIFF=$(( $END - $START ))
    echo "It took $DIFF seconds for iteration $j" >> output_times.txt
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
