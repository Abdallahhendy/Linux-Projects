#!/bin/bash

src="/data/"
tmp_dst="/backup/.tmp-daily"
tmp_name="/tmp/daily-encr-bak.tar.gz"
fin_dst="/backup/daily/daily-encr-bak.tar.gz.gpg"
log="/backup/logs/encr_bak.log"
passphrase="1234"

echo "[$(date)] Encrypted Daily Backup Started" >> $log


# The process: rsync -> compress -> encrypt -> move to the final distination


mkdir -p $tmp_dst

# 1- rsync (move the files in incremental logic)
rsync -av --delete $src $tmp_dst >> $log 2>&1

# 2- Compress the transnfered files with tar
tar -czf $tmp_name -C $tmp_dst . >> $log 2>&1

# 3- Encrypt with gpg [easy for install and use]
gpg --yes --batch --passphrase $passphrase -c $tmp_name

# 4- move from the tmp name to the final distination
mv "$tmp_name.gpg" $fin_dst
rm -f $tmp_name


echo "[$(date)] Backup Completed Succssfully" >> $log
