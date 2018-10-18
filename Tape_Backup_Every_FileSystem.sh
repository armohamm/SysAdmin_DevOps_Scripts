#!/bin/ksh

df -g |awk '{print $7}'|


 while IFS= read -r line

 do

dsmc incremental "$line" -subdir=yes
 done
