#!/usr/bin/bash

WSL="/mnt/c/Windows/system32/wsl.exe"
EXPLORER="/mnt/c/Windows/explorer.exe"
PDF=$1

if test -f $WSL; then
	$($EXPLORER $PDF)
else
	evince $PDF
fi
	
