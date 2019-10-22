#!/bin/bash

LTIME=`stat -c %Z /usr/local/apache2/conf/extra/nc.conf`
echo $LTIME

while true
do
   ATIME=`stat -c %Z /usr/local/apache2/conf/extra/nc.conf`

   if [ "$ATIME" != "$LTIME" ]
   then
       echo $ATIME vs $LTIME
       echo "apachectl -k graceful"
       apachectl -k graceful
       LTIME=$ATIME
   fi
   sleep 5
done

