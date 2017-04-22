#!/bin/bash

source /etc/evs/config
docker ps -a | grep pg01 
if [ $? -eq 0 ] ; then
 docker stop pg01 && docker rm pg01
fi
docker ps | grep pg01 
if [ $? -eq 0 ] ; then
 docker rm pg01
fi


docker run --name pg01 \
  --network=phoenix_network \
  -v /u01/pg96/data:/u01/pg96/data \
  -v /u02/backup:/u02/backup \
  -v /u02/archive:/u02/archive \
  -p 5432:5432 \
  --privileged \
  -e INITAL_NODE_TYPE=${PG_INITIAL_NODE_TYPE} \
  -e NODE_ID=${NODE_ID} \
  -e NODE_NAME=${PG_NODE_NAME} \
  -e ARCHIVELOG=1 \
  -e MSLIST=${MSLIST} \
  -e MSOWNERPWDLIST=${MSOWNERPWDLIST} \
  -e MSUSERPWDLIST=${MSUSERPWDLIST} \
  -e REPMGRPWD=${REPMGRPDW:-evs123} \
  pg:9.6.2
