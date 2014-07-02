#!/bin/bash

# Script which takes a markdown file and reproduces it
# with each line reduced to eighty characters or
# fewer.

function breakline {
	local text=$1
	local rtn=""
	while [[ ${#text} -gt 0 ]]; do
		if [[ ${#text} -gt 80 ]]; then
			local COUNTER=80
			local spaceloc=0
			local delimiter="\n"
			while [[ $spaceloc -eq 0 ]]; do
				if [[ "${text:$COUNTER:1}" = " " ]]; then
					let spaceloc=$COUNTER
				fi
				let COUNTER-=1
				if [[ $COUNTER -eq 0 ]]; then
					let spaceloc=79
					delimiter="-"$delimiter
				fi
			done

			rtn=$rtn${text:0:$spaceloc}$"$delimiter"
			text=${text:$spaceloc}
		else
			rtn=$rtn$text
			text=""
		fi
	done

	#return
	echo -e $rtn
}

while read line
do
	echo -e $"$(breakline "$line")"
done < $1