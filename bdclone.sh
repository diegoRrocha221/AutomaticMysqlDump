#!/bin/bash
DATE=$(date +"%Y-%m-%d-%H-%M-%S")
FILENAME="db_dump_$DATE.sql"

mysqldump -u username -p password db_name > $FILENAME

ftp -n -v ftp.server.com << EOT
user username password
cd /path/to/dump/directory
put $FILENAME
bye
EOT

rm $FILENAME