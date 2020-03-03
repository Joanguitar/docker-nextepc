#!/bin/sh

echo "sending traffic"
docker exec -it ue route add default tun_srsue # define default route
docker exec -it ue ping 8.8.8.8
