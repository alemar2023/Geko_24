# GeKo

Requirements:

- Ruby: 3.2.2
- Rails: 7.1.2
- Node: 18.18.2 up
- Yarn: 1.22.19 up
- Postgress

# Getting started:

- `bundle install`
- `yarn install`
- `rails assets:precompile`


# Setup database

- Install postgress by run: `sudo apt update && sudo apt install postgresql postgresql-contrib`
- Go to: `t-card/config` and rename file `database.yml.sample` to `database.yml`
- Run: `yarn install --check-files`
- Make a new superuser: `sudo -u postgres createuser --superuser name_of_user`
- Open postgres with new user: `sudo -u name_of_user psql postgres`
- Change pw to this user: `ALTER USER name_of_user WITH PASSWORD 'your_strong_password';`
- Exit from postgress
- `rake db:create`
- `rake db:migrate`

# Running the app

- `rails s` start the app at `localhost:3000`


Now you can access to all app parts
