#!/bin/bash
#
# Based on:
# http://razius.com/articles/auto-refreshing-google-chrome-on-file-changes/
#
# Looks for changes on .tex files and call make pdf on every change
#
# Needed packages on F21: inotify-tools xdotool
#IFILE='./*.tex ./*.cls'
IFILE='./*.tex'
TIME_FORMAT='%F %H:%M'
OUTPUT_FORMAT='%T Refreshing due changes on %w.'

clear

while inotifywait -q -r --timefmt "${TIME_FORMAT}" --format "${OUTPUT_FORMAT}" $IFILE; do
	while [ -f Make-running ];do
		echo -e "\e[32m make running, skipping\e[0m"
		sleep 2
	done

	make pdf &> /dev/null
	if [[ $? -eq 0 ]];then
		echo -e "\e[32mmake pdf OK!\e[0m"
	else
		echo -e "\e[31mmake pdf FAILED!\e[0m"
		make unlock &> /dev/null
	fi

	# Just to avoid dangerous loops
	sleep 1
done
