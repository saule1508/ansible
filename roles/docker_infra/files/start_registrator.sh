#!/bin/bash

#Registrator -> register docker containers into consul
CONSUL_IP=127.0.01

docker run --net=host --name registrator \
  -v /var/run/docker.sock:/tmp/docker.sock \
  gliderlabs/registrator:latest -internal consul://${CONSUL_IP}:8500
