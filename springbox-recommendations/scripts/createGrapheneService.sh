#!/bin/bash
URL="http://springbox.sb05.stations.graphenedb.com:24789/db/data/"
USERNAME="springbox"
PASSWORD="dD31yCWjenueI4MQCXU8"

X=$IFS
IFS='/'

TOKENS=( $URL )
SEC_URL=${TOKENS[0]}//${USERNAME}:${PASSWORD}@${TOKENS[2]}/${TOKENS[3]}/${TOKENS[4]}

IFS=$X

JSON=`printf '{"neo4jUri":"%s"}' $SEC_URL`
echo $JSON
cf cups springbox-recommendations-db -p ${JSON}
