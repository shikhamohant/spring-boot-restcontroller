#!/bin/bash 
ls -ltr
cmd="java -jar *.jar"
status=$?
[ $status -eq 0 ] && echo "$cmd command was successful" || echo "$cmd failed"
