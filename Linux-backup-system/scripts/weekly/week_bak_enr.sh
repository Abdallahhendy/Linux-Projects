#!/bin/bash

week=$(date +%V)
year=$(date +%Y)
src="/data/"
tmp_base="/backup/.tmp-weekly"
tmp_dst="$tmp_base/week-$year-$week"
tmp_name="/tmp/weekly-backup-$year-$week.tar.gz"
fin_dst="/backup/weekly/weekly-backup-$year-$week.tar.gz.gpg"
log="/backup/logs/week_encr_bak.log"
passphrase="1234"

echo "[$(date)] Weekly Encrypted Backup Started ..." >> $log 2>&1


###### The process: rsync -> compress -> encrypt -> move the final distation -> retention for 4 weeks

#### 1- rsync
mkdir -p $tmp_base
rsync -av --delete $src $tmp_dst >> $log 2>&1

#### 2- compress
tar -czf $tmp_name -C $tmp_dst . >> log 2>&1

#### 3- encrypt
gpg --yes --batch --passphrase $passphrase -c $tmp_name >> $log 2>&1

#### 4- Move
mv $tmp_name.gpg $fin_dst
rm -f $tmp_name

#### 5- Retention
find "/backup/weekly" -name "*.gpg" -mtime 28 -delete


echo "[$(date)] Backup Completed Successfully" >> $log 2>&1

