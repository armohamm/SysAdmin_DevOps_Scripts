
#!/bin/ksh

_errors="$( find . -name db2diag.log |xargs grep -i errors |grep -v sqllib_old >> /home/root/db2s.log)"
_severe="$( find . -name db2diag.log |xargs grep -i severe |grep -v sqllib_old >> /home/root/db2s.log)"
_date="$(date) >> /home/root/db2s.log "
_host="$(hostname) >> /home/root/db2s.log"

if grep -q Severe /home/root/db2s.log;then
 mail -s "Severe Found" mail@.slack.com < /home/root/db2s.log;
fi

if grep -q Errors /home/root/db2s.log;then
 mail -s "Severe Found" mail@.slack.com < /home/root/db2s.log;
fi
