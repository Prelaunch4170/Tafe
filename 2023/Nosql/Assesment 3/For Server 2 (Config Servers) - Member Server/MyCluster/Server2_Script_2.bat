echo Configure shard Replica Set.
	mongo --port 27011 --eval "rs.initiate()"
	mongo --port 27011 --eval "rs.add('192.168.159.27:27012')"
	mongo --port 27011 --eval "rs.add('192.168.159.27:27013')"


echo Configure shard Replica Set.
	mongo --port 27021 --eval "rs.initiate()"
	mongo --port 27021 --eval "rs.add('192.168.159.27:27022')"
	mongo --port 27021 --eval "rs.add('192.168.159.27:27023')"