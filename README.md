# Tailored Drip Art

Description: This is a website to help house owners find tailored drip art for their houses - [link](https://art-tailored.com) :smile:

## Stack and requirements :brain:

### Stack
* Docker Compose: Containerization
* RubyOnRails: Back-end framework (Rails: 6.1.7 - Ruby: 3.1.2)
* Postgre: Database
* Rspec: Testing framework
* Bulma: CSS framework

### Requirements 
* Docker compose
* Docker

## How to launch app :mechanical_arm:

- Clone project
- Go to project folder: `cd dripart/`
- Create docker image and containers : `docker compose build`
- Launch containers in a project terminal : `docker compose up`
- In another project terminal, create database and add migrations: `docker compose run --rm web rails db:create db:migrate`
- Open browser and go to: `http://localhost:3000`

## How to test app :test_tube:

- Create database, add migrations and seeds in Test: `docker compose run --rm web rails db:create db:migrate db:seed RAILS_ENV=test`
- Run rspec tests: `docker compose run --rm web rspec spec`
- To check linter, run rubocop: `docker compose run --rm web rubocop`
