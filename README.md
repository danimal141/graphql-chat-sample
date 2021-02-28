# graphql-ruby-chat-example

This is a sample app to test the following stuff:

- Authentication by [Auth0](https://auth0.com/)
- GraphQL Subscription with ActionCable
  - Open: http://localhost:3000/room/:name after setting up the project.

In this project, I use Ruby on Rails (with graphql-ruby) and React.js.

## How to develop
### Backend
1. `cd  backend`
1. `cp .env.sample .env`
1. `cp .env.development.local.sample .env.development.local`
1. `docker-sync start`
1. `docker-compose run --rm web bin/setup` or `bin/run web bin/setup`
1. `docker-compose run --rm web bundle exec rails ridgepole:apply` or `bin/run web bundle exec rails ridgepole:apply`
1. `docker-compose up`

### Frontend
1. `cd  frontend`
1. `cp .env.local.sample .env.local`
1. `yarn install`
1. `yarn codegen` (if some graphql is updated)
1. `yarn start`
