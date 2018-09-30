
#!/bin/ksh
mon="$(df -g /db/a3ingcs1/db2backup | head -2| tail -1|awk {'print $4'} |tr -d '%')"
monf="$(df -g /db/a3ingcs1/db2backup > /home/root/fs.log)"
sleep 5
if [ ${mon} -gt 85 ] ; then
echo " ##### Pro-active alert #####" >> /home/root/fs.log
echo "FreeSpace Headsup: /db/a3ingcs1/db2backup" >> /home/root/fs.log
mail -s "FreeSpace Headsup" mail@slack.com < /home/root/fs.log;
sleep 2
mv /home/root/fs.sh /home/root/fs.sh_bkp
fi
