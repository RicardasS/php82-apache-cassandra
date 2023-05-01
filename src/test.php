<?php
$cluster = Cassandra::cluster()
  ->withContactPoints('db')
  ->build();
$keyspace = getenv('KEYSPACE_NAME');
$session = $cluster->connect($keyspace);

$statement = new Cassandra\SimpleStatement(
  "INSERT INTO $keyspace.my_table (id, name) VALUES (uuid(), 'John')"
);
$session->execute($statement);

$statement = new Cassandra\SimpleStatement(
  "SELECT * FROM $keyspace.my_table"
);
$result = $session->execute($statement);

foreach ($result as $row) {
  echo "ID: " . $row['id'] . ", Name: " . $row['name'] . "\n";
}
