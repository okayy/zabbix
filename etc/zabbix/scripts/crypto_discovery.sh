#!/bin/bash

JSONSTREAM="{ \"data\":[ "
IFS=$'\n'

for var in $(/opt/cprocsp/bin/amd64/csptestf -keys -enum -verifyc -fqcn | grep HDIMAGE)
do    
    string=$(echo $(/opt/cprocsp/bin/amd64/csptestf -keyset -cont "$var"))
    if [[ $string == *"Container"* ]] && [[ $string == *"PrivKey"* ]] ; then
        NAME=$(echo $string | awk -F' name: | Signature ' '/CSP.*Signature/{print $2}')
        DATE=$(echo $string | grep -Eo '[[:digit:]]{2}[.][[:digit:]]{2}[.][[:digit:]]{4}')        
        JSONSTREAM="$JSONSTREAM{ \"{#CRYPTOCON}\":$NAME }, "
    fi
done

JSONSTREAM="$JSONSTREAM{ \"{#CRYPTOCON}\":\"ALLQUEUES\" } ]}"

echo $JSONSTREAM


