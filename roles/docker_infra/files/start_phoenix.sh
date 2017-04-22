#!/bin/bash

# this should start the stack
# note that postgres and registrator are starting outside the stack
# because swarm does not support privileged containers

docker stack deploy -c /opt/evs/run/docker-compose.infra phoenix
