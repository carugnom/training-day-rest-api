# Welcome to your Training Day!

Before you get started make sure you have the following requirements fulfilled:

## Requirements
1. [Install Docker](https://docs.docker.com/engine/install/)
2. [Install Docker-Compose](https://docs.docker.com/compose/install/)
3. Go into the root of the project folder and run the following command: `docker-compose up`
4. Run the following command to check if the database has been seeded correctly
`docker-compose exec postgres psql -c 'SELECT * FROM news;'`

It should produce the following output
```
➜  training-day-rest-api git:(master) docker-compose exec postgres psql -c 'SELECT * FROM news;'
 id |      headline      |      text      |  publication   |          date          
----+--------------------+----------------+----------------+------------------------
  1 | This is a headline | This is a text | New York Times | 2021-01-01 00:03:00+00
(1 row)
```

5. ***OPTIONAL*** If you need a tool to browse the database in a more visual fashion go to `localhost:16543` and login with the following credentials:
```
username: test@gmail.com
password: test123!
```
5. Connect to the database by clicking `Add New Server`
6. Type in whatever name you want for the connection
7. click on Connection and fill out the following:
```
Hostname/address: postgres
Port: 5432
Maintenance database: root
Username: root
Password: root
```
8. Click Save
9. You should now be successfully connected to the database.

## Task
[...]