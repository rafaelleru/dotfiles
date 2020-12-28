#!/bin/bash
while read line
do
  echo -e "\e[90m$line" # Dark Grey
  read line
  echo -e "\e[37m$line" # Light Gray
done
echo -en "\e[0m"
