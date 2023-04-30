//Run this in Server2

echo off
md csrs\csrs1\db csrs\csrs1\log csrs\csrs2\db csrs\csrs2\log csrs\csrs3\db csrs\csrs3\log
echo Created mongoDb folder structure for Config Server Instances


md sh01\sh011\db sh01\sh011\log sh01\sh012\db sh01\sh012\log sh01\sh013\db sh01\sh013\log
echo Created mongoDb folder structure for Shard 01 Server Instances

md sh02\sh021\db sh02\sh021\log sh02\sh022\db sh02\sh022\log sh02\sh023\db sh02\sh023\log
echo Created mongoDb folder structure for Shard 02 Server Instances
md router\log
echo Db path, log path creation completed
echo on


echo starting Config replicaSet member's
	start mongod -f csrs1.conf
	start mongod -f csrs2.conf
	start mongod -f csrs3.conf

echo starting Shard 01 Replica Set member's.
	start mongod -f sh011.conf
	start mongod -f sh012.conf
	start mongod -f sh013.conf	

echo starting Shard 02 Replica Set member's.
	start mongod -f sh021.conf
	start mongod -f sh022.conf
	start mongod -f sh023.conf

echo wait time for server's to start. before we configure.
timeout 5

echo Configure Coniguration Replica Set.
echo use ip or use machineName, note localhost won't work
	mongo --port 26001 --eval "rs.initiate()"	
		echo this will start showing it as primary.
		echo add 2 other config server to the replicaset.
	mongo --port 26001 --eval "rs.add('192.168.159.27:26002')"
	mongo --port 26001 --eval "rs.add('192.168.159.27:26003')"