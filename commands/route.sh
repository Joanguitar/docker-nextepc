#!/bin/sh

echo "sending traffic"
docker exec -it ue1 route add default tun_srsue # define default route
docker exec -it ue2 route add default tun_srsue # define default route
