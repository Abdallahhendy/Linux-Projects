#!/bin/bash

services=("ssh" "cron" "systemd-journald")
logs="../logs/services.log"
cpu=50
mem=30


for service in "${services[@]}"; do

	systemctl is-active --quiet $service

	if [ $? -eq 0 ]; then
		echo "[$(date)] $service is running" >> $logs

		pid=$(systemctl show $service --property=MainPID --value)

		if [ $pid -ne 0 ]; then
			cpu_usg=$(ps -p $pid -o %cpu --no-headers | awk '{print int($1)}')
			mem_usg=$(ps -p $pid -o %mem --no-headers | awk '{print int($1)}')

			if [ "$cpu_usg" -gt $cpu ]; then
				echo "[$(date)] WARNING: $service CPU Usage is High [${cpu_usg}%]" >> $logs
			fi

			if [ "$mem_usg" -gt $mem ]; then
                                echo "[$(date)] WARNING: $service Memory Usage is High [${mem_usg}%]" >> $logs
			fi
		fi

	else
		echo "[$(date)] $service is DOWN. Attempting to Restart ..." >> $logs

		systemctl restart $service

		if [ $? -eq 0 ]; then
			echo "[$(date)] $service restarted successfully :)" >> $logs
		else
			echo "[$(date)] $service failed to restart :(" >> $logs
		fi
	fi

done
