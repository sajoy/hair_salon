



Create the database by running the following in psql:

'''''
CREATE DATABASE hair_salon;

\c hair_salon

CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);

CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);

CREATE TABLE appointments (id serial PRIMARY KEY, client_id int, stylist_id int);

CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;

'''''
