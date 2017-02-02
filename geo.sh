#!/bin/bash
MAPSAPIURL="http://maps.googleapis.com/maps/api/geocode/json"
 
[ -f latlng.txt ] && rm latlng.txt
[ -f results.json ] && rm results.json
 
while read line; do
	    # Get address from column 3 and 4 of a CSV file provided as argument and prepare the string address. YMMV.
	        address='tamarindo'
		    curl -G -s --data sensor=true --data-urlencode address=$address "$MAPSAPIURL" -o results.json
		        # Parse json with jshon (http://kmkeen.com/jshon/)
			    jshon -e results -a -e geometry -e location -e "lat" -u -p -e "lng" -u < results.json | paste -d, - - >> latlng.txt
			        sleep 1
			done < $1

