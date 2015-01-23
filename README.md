Headcount
========

by Debbie Cravey

Headcount creates a listing of hair stylists and their customer roster for a hair salon. It allows the salon owner to maintain the lists by adding and deleting stylists and their clients.

Installation
------------

Install Headcount by first cloning the repository.
Using Postgres and SQL:
* CREATE DATABASE salon;
* CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
* CREATE TABLE clients (id serial PRIMARY KEY, client_name varchar, list_id int);
* CREATE DATABASE salon_test WITH TEMPLATE salon;


```
$ git clone http://github.com/dacravey/Headcount
```

Install all of the required gems:
* sinatra
* sinatra-contrib
* pg
```
$ bundle install
```

Start the webserver:
```
$ ruby app.rb
```

In your web browser, go to http://localhost:4567

Contribute
----------
- Issue Tracker: github.com/dacravey/Headcount/issues
- Source Code: github.com/dacravey/Headcount

Support
-------

If you are having issues, please let me know at: cinder.the.rogue@gmail.com

Bug reports
===========

If you discover any bugs, feel free to create an issue on GitHub. Please add as much information as possible to help with fixing the possible bug. I also welcome your help if you choose to fork and send a pull request.

https://github.com/dacravey/repository/issues

License
=======

MIT License. Copyright 2015 Debbie Cravey
