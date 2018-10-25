#!/bin/ksh

df -g |awk '{print $7}'|grep -v gsa|


 while IFS= read -r line

 do

dsmc incremental "$line" -subdir=yes
 done
