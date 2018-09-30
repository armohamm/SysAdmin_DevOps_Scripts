#!/bin/ksh

# 0,5,10,15,20,25,30,35,40,45,50,55 * * * * /home/rmadmin/devops.sh >/dev/null 2>&1


source=/Dev/Dir/To/Update
sourcejar=/Dev/Dir/To/Update/GILPlugin.jar
target=/Ops/Dir/Deploy/Application.jar
watch1=/Ops/Dir/Deploy/watch1.log

## Connect NFS
/home/srvwas0/NFSID.gce.sh /home/srvwas0/NFSID.gce.dat > /dev/null 2>&1

 find $source -name Applicaton.jar -mmin -5 -type f -exec ls {} + > $watch1

if [ -s $watch1 ]
then
    mail -s "$(hostname) $target" mail@slack.com < $watch1
    cp -rf "$target" "$target-$(date +"%Y%m%d-%H%M%S")"
    cp -rf "$sourcejar" "$target"
    chmod 775 /Ops/Dir/Deploy/Application.jar
else
echo "$watch1 is empty"
fi
