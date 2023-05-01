<?php
$cluster = Cassandra::cluster()
  ->withContactPoints('db')
  ->build();
$keyspace = getenv('KEYSPACE_NAME');
$session = $cluster->connect();

$session->execute("CREATE KEYSPACE IF NOT EXISTS $keyspace WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}");
$session->execute("CREATE TABLE IF NOT EXISTS $keyspace.my_table (id UUID PRIMARY KEY, name text)");

echo "Keyspace and table created successfully!";
