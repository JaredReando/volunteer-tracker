# Volunteer Tracker

#### _Database app for tracking projects and volunteers._

#### By _**Jared Reando**_

## Description

Easily keep track of multiple projects and volunteers using this delightfully simple web application. It really does it all:

  - Create projects
  - Edit project names
  - Add volunteers to existing projects
  - Edit volunteer names
  - Delete volunteers and projects for various reasons:
    - Project completed
    - Cancellations
    - Crippling shame/failure

View this site hosted [HERE](https://glacial-ravine-14472.herokuapp.com/) on Heroku.

## Setup/Installation Requirements

* Clone this project repository to your local drive. Link: https://github.com/JaredReando/volunteer-tracker/
* To make changes of your own to this project, open the downloaded directory files into a developer text-editing program.
  I use _[Atom](https://atom.io/)_ (It's free!)
* A database template file included in the repo. Once saved locally, open a Terminal session and navigate to the project directory.
* Run commands:
  * $ createdb volunteer_tracker
  * $ psql volunteer_tracker < my_database.sql
  * $ createdb -T volunteer_tracker volunteer_tracker_test

Mac Ruby setup:
  * Install homebrew
  * Install postgres ($ brew install postgres)
  * To start postgres server, just run $ postgres
    * For editing, use 3 windows in Terminal: Terminal, postgres, and server window. Use Cmd+T on a Mac to open new tabs in Terminal
  * Visit the Ruby site for setup help: [www.ruby-lang.org](https://www.ruby-lang.org/en/)
  * gem install postgres

## Support and contact details

_Questions or feedback: jaredreando@gmail.com_

## Technologies

- Created with Ruby 2.5.3.
- Deployed to Heroku using the Sinatra web framework.
- See project GEMFILE for complete list of gems

## Objectives

- [x] Objects are created from a custom class with custom methods.

- [x] Tests are 100% passing. You may not significantly alter the included tests but you may add additional tests as necessary.

- [x] Database is set up correctly.

- [x] Correct set up of a one-to-many relationship.

- [x] Sinatra has required CRUD functionality.

- [x] Project has strong commit history history.

- [x] Project has detailed README with all necessary setup instructions and a description of the project.

- [x] Required functionality was in place by the Friday deadline.

- [x] Student can demonstrate understanding of Ruby concepts if asked.


### License

Copyright (c) **Jared Reando**

Licensed under the MIT License
