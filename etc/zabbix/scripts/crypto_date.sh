#!/bin/bash


string="$(exec /opt/cprocsp/bin/amd64/csptestf -keyset -cont "$1" )"
DATE=$(echo $string | grep -Eo '[[:digit:]]{2}[.][[:digit:]]{2}[.][[:digit:]]{4}')
DATE=$(date -d "$(echo "$DATE" | perl -pe 's/(\d+).(\d+).(\d+)/\3-\2-\1/;')" +%s)
NOW=`date '+%s'`

if [ "_$2" == "_" ]; then
  echo $DATE
else
  if [ $(echo "($DATE-$NOW)/86400" | bc) -gt 0 ]; then
    echo "($DATE-$NOW)/86400" | bc
  else
    echo 1
  fi
fi


