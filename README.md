# ShareHub: Picture or Photo Sharing Site

This is my first rails app.For Picture and Photo Sharing.

Live demo on heroku:http://sharehub-andy.herokuapp.com/

## Install
### Get the code
```
git clone git://github.com/AndySze/sharehub.git
cd sharehub
bundle install
```
### Database setup & Go
```
cp config/database-sample.yml config/database.yml 
rake db:migrate
rails s
```
## deploy to production
1、like above get the code；
2、config the database
```
cp config/database.yml.example config/database.yml
vim database.yml #edit the database config
RAILS_ENV=production rake db:create
RAILS_ENV=production rake db:migrate
```
3、config nginx and unicorn
```
cp config/unicorn.rb.example config/unicorn.rb
cp config/nginx.conf.example config/nginx.conf
vim config/nginx.conf #change the url
ln -nfs $(pwd)/config/nginx.conf /etc/nginx/sites-enabled/sharehub
mkdir -p tmp/pids
touch tmp/pids/unicorn.pid
rake assets:precompile
sudo nginx -s reload #maybe you should restart the nginx
unicorn -c config/unicorn.rb -E production -D
```
4、go to your url.

## Still not perfect
Lots work to do.I will working on it.

