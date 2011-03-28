#!/bin/python
import sys

# purpose of the code is to take the input data and convert the 
# duration string into a continuous numerical feature.
# output the duration as minutes and everything else, in tab-separated
# format.

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
	print "\t".join([name.lower(),gender,secs,team.lower(),float(secs)/60,time])

