#!/bin/bash
# ChromeShot is tool to take screenshot of URLs or IPs from a text file using google-chrome --headless method
# written by Anand A S https://anandsreekumar.com
filename='hosts.txt' 
filelines=`cat $filename`
dir="output"
directory=$filename-$dir
mkdir $directory
for line in $filelines ; do
	export HOST=$line
	google-chrome-stable --headless --window-size=1024,768 --hide-scrollbars --screenshot=$directory/${HOST}.png http://${HOST}
	echo Saved $directory/${HOST}.png
done
echo Finished $filename
notify-send Chrome Shot finished $filename
