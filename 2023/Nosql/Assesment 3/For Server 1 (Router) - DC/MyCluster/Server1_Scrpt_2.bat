echo Add Shard 01 and Shard 02 to the Cluster through router.
	mongo --port 26000 --eval "sh.addShard('sh01/192.168.159.27:27011')"	
	mongo --port 26000 --eval "sh.addShard('sh02/192.168.159.27:27021')"
	mongo --port 26000 --eval "sh.status()"
