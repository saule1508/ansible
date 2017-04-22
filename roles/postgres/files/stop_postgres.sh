#!/bin/bash

CONT=$( docker ps | grep pg01 | awk '{print $1}' )
if [ ! -z $CONT ] ; then
 echo stopping $CONT
 docker stop $CONT
fi
CONT=$( docker ps -a | grep pg01 | awk '{print $1}' )
if [ ! -z $CONT ] ; then
 echo removing $CONT
 docker rm $CONT
else
 echo no container pg01
fi
exit 0
