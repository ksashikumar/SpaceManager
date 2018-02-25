# SpaceManager

Space Manager is a management solution for short term leasing or retail spaces.
[API Documentation](https://space-manager-api.herokuapp.com/swagger) | [Demo](https://space-manager-api.herokuapp.com/spaces)

### Requirements
- Ruby 2.5.0
- Rails 5.1.5
- PostgreSQL

### Installation

```sh
git clone git@github.com:ksashikumar/SpaceManager.git
cd SpaceManager
bundle install
rake db:create
rake db:migrate
rake db:seed
rails s
```