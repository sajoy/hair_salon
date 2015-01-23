Hair Salon
----------

An app to help a hair salon keep track of which clients see which stylists.
Created by Sarah Joy Calpo.

Set Up
----------

1. Clone this repository
2. Install and run bundler
```
$ gem install bundler
$ bundle
```
3. Create the relevant databases by running the following in psql


    CREATE DATABASE hair_salon;

    \c hair_salon

    CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);

    CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);

    CREATE TABLE appointments (id serial PRIMARY KEY, client_id int, stylist_id int);

    CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;


4. Start Sinatra `$ ruby app.rb`
5. Go to 'localhost:4567' in your favorite browser!


Copyright
----
MIT 2015
