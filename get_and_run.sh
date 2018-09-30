
#!/bin/ksh
last |head -10|awk '{print $1}'|

 while IFS= read -r line
 do
su - "$line" -c 'tail .sh_history'
 done
