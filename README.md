# Appetype

[![Build Status](https://travis-ci.org/aidamanna/appetype.svg?branch=master)](https://travis-ci.org/aidamanna/appetype)
[![Maintainability](https://api.codeclimate.com/v1/badges/b2aee03ad69cc0ffa2b2/maintainability)](https://codeclimate.com/github/aidamanna/appetype/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/b2aee03ad69cc0ffa2b2/test_coverage)](https://codeclimate.com/github/aidamanna/appetype/test_coverage)

Appetype is an application that allows your company to easily manage the catering menu offered to their employees.

With Appetype you can create next week's menu, send it to your employees and collect their orders.

Appetype is built on top of [Typeform](https://www.typeform.com/) and it's powered by its [Create API](https://developer.typeform.com/create/), [Webhooks API](https://developer.typeform.com/webhooks/) and [Embed](https://developer.typeform.com/embed/).

# Usage

[![View it in action](https://user-images.githubusercontent.com/9199692/36027566-257263a8-0d9c-11e8-8464-1f047c3334fb.png)](http://www.youtube.com/watch?v=Uf73oqv0jE4)

The first thing you need to do is authorising Appetype to use Typeform. To do so log in with an admin user, go to the user menu, click Authorize and follow the instructions. Once you are authenticated you can start using Appetype.

A normal workflow will look like the following:

* The catering user creates next week's menu. This will be a draft version of the menu.
* The admin user reviews the menu and updates it if necessary. When the menu is ready the admin user can make it available to diner users by publishing it.
* Once the menu is published, diner users can fill their choices for next week.
* The admin user closes the menu when the time for placing orders has finished.
* The catering user checks the menu orders. Now they can go to the market to buy the ingredients!

#### Technical notes

When a menu is published, Appetype creates a Typeform and configures a webhook to receive the orders.

Fill menu page is embedding the Typeform we created. When diner users fill the Typeform, a weebhook is received and processed to show the correct results.

When closing the menu, the Typeform is made private so that no one else can access it.

# Set up

#### Ruby version

[Ruby 2.4.0](https://rvm.io/rvm/install)

#### System dependencies

Install [bundler](http://bundler.io/) and run ```bundle install```.

#### Database

Install PostgreSQL. If you're on OSX, you can use Postgres.app and Postico.

Alternatively, you can run Postgres inside a [docker container](https://hub.docker.com/_/postgres/). 

Create the DB running ```bundle exec rake db:create``` and execute the migrations ```bundle exec rake db:migrate```.

Running seeds ```bundle exec rake db:seed``` will populate the database with three users. Check seeds for more information.

#### Email delivery service

[Sengrid](https://sendgrid.com/).

#### Static code analyzer and tests

The code follows [Ruby Stype Guidelines](https://github.com/bbatsov/ruby-style-guide). Run [Rubocop](https://github.com/bbatsov/rubocop) to ensure them by executing ```bundle exec rubocop```.
Execute ```bundle exec rspec``` to run the tests.

#### Deploy your own instace to Heroku

You can deploy your application to Heroku in one click using the button below and following the instructions.

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)
