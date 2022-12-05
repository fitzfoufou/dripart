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

## How to deploy app :bullettrain_front:

### Requirements
- You already have a remote instance running on an Ubuntu 
- You have the project requirements

### Steps
- Connect to a remote instance: `ssh -i [path_to_key] [instance_user]@[instance_ip]`
- Create a docker-compose file: `touch docker-compose.yml` and paste docker-compose-prod.yml
- Create a .env file with the requiring environnement variables:
  - `RAILS_ENV=production`
  - `DB_USER=xxx`
  - `DB_PASSWORD=xxx`
  - `PRODUCTION_HOST=art-tailored.com`
- Pull web image: `docker pull firzfoufou/dripart:v1`
- Pull git project from main branch: `git pull`
- Build and launch docker compose in detached mode: `docker-compose up -d`
- Create and migrate db: `docker compose exec web rails db:create db:migrate`
- Precompile assets: `docker compose web rails assets:precompile`
