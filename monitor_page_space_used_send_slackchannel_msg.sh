
#!/bin/ksh
mon="$(svmon -G -O unit=MB | head -5|tail -1| awk {'print $4'})"
monf="$(svmon -G -O unit=MB | head -5|tail -1| awk {'print $4'} > /home/root/svmon.log)"
if [ ${mon} -gt 1900 ] ; then
mail -s "pgsp" mail@slack.com < /home/root/svmon.log;
fi
