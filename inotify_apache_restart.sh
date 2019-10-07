#!/bin/sh

FILE=/usr/local/apache2/conf/extra/nc.conf
if [ ! -f "$FILE" ]; then
    touch "$FILE"
fi

inotifywait -m --timefmt '%d/%m/%y %H:%M' --format '%T %w %f' \
-e close_write $FILE | while read date time dir file; do
       sleep 1
       echo apachectl -k graceful
       #rsync --progress --relative -vrae 'ssh -p 22'  $FILECHANGEREL usernam@example.com:/backup/root/dir && \
       echo "At ${time} on ${date}, apachectl -k graceful"
done
