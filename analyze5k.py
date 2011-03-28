#!/bin/python
import sys


for line in sys.stdin:
	data = line.strip()
	(bib,name,time,gender,team) = data.split('\t')
	# split the time on :. If it has 2 components then it's MM:SS.
	# if 3 components then HH:MM:SS
	time_components = time.split(':')
	if len(time_components) == 2:
		secs = (int(time_components[0]) * 60) + int(time_components[1])
	elif len(time_components) == 3:
	 	secs = (int(time_components[0]) * 3600) + (int(time_components[1]) * 60) + int(time_components[2])
	print "%s\t%s\t%s\t%s\t%.2f\t%s" % (name.lower(),gender,secs,team.lower(),float(secs)/60,time)
