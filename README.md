# PHP 8.2-Apache with Cassandra Docker Image

This repository provides a Docker setup for running a PHP 8.2-Apache web server with support for the Cassandra database. The image is built using external libraries and includes all necessary configuration files.

## Table of Contents
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Configuration](#configuration)
- [Acknowledgements](#acknowledgements)

## Prerequisites
- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Getting Started
1. Clone this repository:
```bash
git clone https://github.com/RicardasS/php82-apache-cassandra.git
cd php82-apache-cassandra
```

2. Start the Docker containers:

```bash
docker-compose up -d
```

3. Access the web server at http://localhost:80 in your browser.
4. Run the create_new_keyspace.php script to create a new keyspace and table in the Cassandra database:

```http://localhost/create_new_keyspace.php```

5. To test the setup, access the test.php script in your browser:

```http://localhost/test.php```

## Configuration
This repository contains the following configuration files:
- Dockerfile: Defines the Docker image with PHP 8.2, Apache, and the Cassandra PHP driver.
- docker-compose.yml: Sets up the container services for the web server and the Cassandra database.
- cassandra.ini: Configures the PHP Cassandra module.
- apache.conf: Configures the Apache virtual host.
- create_new_keyspace.php: Script for creating a new keyspace and table in the Cassandra database.
- test.php: Script for testing the connection to the Cassandra database and displaying a list of tables.

## Acknowledgements
- PHP
- Apache HTTP Server
- ScyllaDB PHP Driver
- ScyllaDB
