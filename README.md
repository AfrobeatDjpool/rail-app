# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
* ...
##To Update cron
bundle exec whenever --update-crontab

## To start Redis
redis-server
##clear rediscache
redis-cli flushall

#
ps -ef | grep sidekiq

## To Start Sidekiq in production env
bundle exec sidekiq -d -L sidekiq.log -q mailer,5 -q default -e production
* ...
https://www.dropbox.com/sh/isay8r4vxnccowt/AAA5Fq9wfxiKWfVWBOJOOA-La?dl=0
https://drive.google.com/uc?id=1uoz7s_nHJXFasaqqNoJblx051FPjiiIE&export=download
ssh ubuntu@54.244.68.241

https://s3-us-west-2.amazonaws.com/cars-database/combined-rnv-files.csv

rake import:rnv RAILS_ENV=production


ssh ubuntu@34.214.46.126

ogr2ogr -f "PostgreSQL" PG:"host=localhost dbname=geodb user=root password=root" "padron_test.gdb"

ogr2ogr -f "PostgreSQL" PG:"host=localhost port=5432 dbname=geodb user=root password=root" padron_test.gdb -overwrite -progress --config PG_USE_COPY YES
cat ~/.ssh/id_rsa.pub | ssh -i database.pem ubuntu@34.214.46.126 'cat >> .ssh/authorized_keys && echo "Key copied"'
