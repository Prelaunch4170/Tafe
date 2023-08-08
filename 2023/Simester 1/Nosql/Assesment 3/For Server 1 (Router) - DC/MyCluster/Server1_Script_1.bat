echo made a router\log directory
md router\log

echo Start mongos: mongs.conf already pointing to the config replicaSet
echo Change the host name in mongos.conf

	start mongos -f mongos.conf

echo wait time for router to start.
timeout 5
