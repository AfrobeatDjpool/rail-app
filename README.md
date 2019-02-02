# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

<!-- songs_create
 Api Details:
 example <<-TEXT
 ---------------------------------------
     {
    api_name: songs,
    method: POST,
    version: v1,
    path: /api/v1/songs
  }


  Header Body:
  example <<-TEXT
---------------------------------------
  {
    Content-Type: application/json
    User-Token:   pZnGtofwatRe2G9DbRy3
  }

  Request Body:
  example <<-TEXT
---------------------------------------
{ "admin_song":
  {
    "name_song": "hdfcccclf"  
  }
}

 Response Body:
 example <<-TEXT
---------------------------------------
{
    "status": 200,
    "data": {
        "song": {
            "id": 8,
            "user_id": 3,
            "name_song": "hdfcccclf",
            "beats": null,
            "genre": null,
            "version": null,
            "name_artist": null,
            "date_uploaded": null,
            "created_at": "2019-01-30T11:59:51.657Z",
            "updated_at": "2019-01-30T11:59:51.657Z"
        }
    },
    "message": "Successfuly Create Song"
}

  
