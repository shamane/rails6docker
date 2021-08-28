# Docker / Docker compose for dev mode

## before check in postgresql stopped, redis stoped locally
`brew services stop postgresql`

`brew services stop redis`

## or who live at port 6379?
`lsof -i -P -n | grep 6379`
`kill -9 <PID>`

## Remove totally all containers locally
`docker system prune -a`

## Build project
`docker-compose build`
`docker-compose run web bundle exec rails db:create`
`docker-compose run web bundle exec rails db:migrate`

## Start server
`docker-compose up --build`

## Stop server
`docker-compose down`


## To build the image:
`docker build -t rails-toolbox --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g) -f Dockerfile .`

### tips
1. https://yizeng.me/2019/11/09/setup-a-ruby-on-rails-6-api-project-with-docker-compose/ (2019)
  1.1 https://yizeng.me/2019/11/12/load-environment-variables-with-docker-compose/
  1.2 https://yizeng.me/2019/11/16/use-redis-for-caching-to-a-docker-compose-managed-rails-project/
  1.3 https://yizeng.me/2019/11/17/add-sidekiq-to-a-docker-compose-managed-rails-project/

2. https://semaphoreci.com/community/tutorials/dockerizing-a-ruby-on-rails-application (2020)
