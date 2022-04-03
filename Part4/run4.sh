#!/bin/bash

main(){

  for ((i=1; i<=$iterationCount; i++));
  do
  cat $nextInputName | sort -nk1 | ./mapper.py | sort -nk1 | ./reducer.py > data/result$i.txt
  if [ $nextInputName != $originalInputName ]
  then
    rm $nextInputName
  fi
  nextInputName="data/result$i.txt"
  final=$i
  done
  echo "Final Result (Node , Distance from source, Path). Ran for $final iterations"
  awk -F ' ' '{print $1, $2, $4}' data/result$final.txt
  mv "data/result$final.txt" "data/output.txt"
}

if [ $# -eq 0 ]
then
  echo "No argument supplied. Taking default file-input name='input.txt' and default iteration='10'"
  echo "Refer readme for custom parameters. "
  nextInputName="data/input.txt"
  originalInputName="data/input.txt"
  iterationCount=850
else
  nextInputName=$1
  originalInputName=$1
  iterationCount=$2
fi

main
