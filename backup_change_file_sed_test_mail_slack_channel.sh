
#!/bin/ksh
cp /etc/hosts /home/root/hosts.bkp
backup=/home/root/hosts.bkp

##Is there backup?

if [ -f $backup ]; then
 echo $backup "Exists"
else 
cp /etc/hosts /home/root/hosts.bkp
echo "copied original to backup"
fi

cat /etc/hosts| sed -e 's/159.137.136.134/#159.137.136.134/g' > /etc/hosts

novoping="$(ping -c 1 -w 1 dbdit.dnb.com | head -1 |awk {'print $3'})"
velhoping="(159.137.136.134):"
data="$(date)"
if [ "$novoping" != "$velhoping" ]; then

echo "####### Following below the ping output #######" >> /home/root/IN10125986
ping -c 1 -w 1 dbdit.dnb.com | head -1 |awk {'print $3'} >> /home/root/IN10125986
echo "pingado" $novoping
echo "####### Following below the /etc/hosts content #######" >> /home/root/IN10125986
cat /etc/hosts >> /home/root/IN10125986
echo "####### End of output at" $data "#######" >> /home/root/IN10125986
echo "feito cat" 
mail -s "IN10125986" mail@slack.com < /home/root/IN10125986;
echo "enviado email"

else

 echo "Not yet" $novoping 

fi
