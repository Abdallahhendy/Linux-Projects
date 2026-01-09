#!/bin/bash

src="/data/"
dst="/backup/daily/"
log="/backup/logs/dir_bak.log"


echo "[$(date)] Daily Backup Started" >> $log
rsync -av --delete $src $dst >> $log 2>&1

echo "[$(date)] Daily Backup Completed Successfully!" >> $log
