# Welcome to your Training Day!

# Task

The company SicroMoft wants a REST API that allows them to Create, Read, Update and Delete (CRUD) news articles into a database. Each news article has tags associated with it, these are accessible through a different endpoint. For the purpose of this exercise these are static, so you can only GET them. Either you get all tags or you can select them by ID. HOWEVER, if you POST a new news article WITH tags that do not exist, these tags NEED to be created!

IMPORTANT: A schema and a database is already given to you. [See Requirements](#Requirements)

*Please create a project in a language of your choice and make the API available to the client via JSON.*

***You are not required to build a frontend*** for this API to visualize it, however, if you do have additional time and you are done early, you are more than welcome to build the frontend and/or to write unit tests.

## We need the following API endpoints
* [News](#News)
* [Tags](#Tags)

## News
* `/news` - GET
```JSON
{
  "news": [
    {
      "id": 1,
      "headline": "This is a headline",
      "text": "This is a text",
      "publication": "New York Times",
      "date": "2021-01-01 00:03:00+00",
      "tags": [
        {
          "id": 1,
          "name": "Negative"
        },
        {
          "id": 2,
          "name": "Important"
        }
      ]
    },
    {
      "id": 2,
      "headline": "This is a headline 2",
      "text": "This is a text 2",
      "publication": "New York Times",
      "date": "2021-01-01 00:03:00+00",
      "tags": []
    }
  ]
}
```

*  `/news/:id` - GET
```JSON
{
  "news": {
      "id": 1,
      "headline": "This is a headline",
      "text": "This is a text",
      "publication": "New York Times",
      "date": "2021-01-01 00:03:00+00",
      "tags": [
        {
          "id": 1,
          "name": "Negative"
        },
        {
          "id": 2,
          "name": "Important"
        }
      ]
    }
}
```

* `/news/:id/tags` - GET
```JSON
{
  "tags": [
    {
      "id": 1,
      "name:": "Negative"
    },
    {
      "id": 2,
      "name": "Important"
    }
  ]
}
```

*  `/news` - POST
```JSON
{
  "news": {
    "headline": "This is a new headline",
    "text": "This is a new text ",
    "publication": "New York Times",
    "date": "2021-01-01 00:03:00+00",
    "tags": [
      "TestTag",
      "TagTest"
    ]
  }
}
```

*  `/news/:id` - PATCH - HINT: Only send fields you want to change
```JSON
{
  "news": {
    "text": "This is an edited text "
  }
}
```

*  `/news/:id` - DELETE


## Tags
* `/tags` - GET
```JSON
{
  "tags": [
    {
      "id": 1,
      "name": "Negative"
    },
    {
      "id": 2,
      "name": "Important"
    },
    {
      "id": 3,
      "name": "Positive"
    },
    {
      "id": 4,
      "name": "Archive"
    },
  ]
}
```

* `/tags/:id` - GET
```JSON
{
  "tag": {
    "id": 1,
    "name": "Negative"
  }
}
```



# Requirements
Before you get started make sure you have the following requirements fulfilled:

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
6. Connect to the database by clicking `Add New Server`
7. Type in whatever name you want for the connection
8. click on Connection and fill out the following:
```
Hostname/address: postgres
Port: 5432
Maintenance database: root
Username: root
Password: root
```
9. Click Save
10. You should now be successfully connected to the database.
