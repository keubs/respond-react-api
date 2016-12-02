# Build & Backend setup
## Ideal file structure

|_ _ respond-react/

|_ _ _ _ frontend code files

|_ _ respond-react-api/

|_ _ _ _ backend code files

|_ _ media

## Requirements:
* PYTHON 3.4.1 https://www.python.org/downloads/release/python-341/
* MySQL (optional)
* pip (should come with python)

## Backend Setup:
* create the env vars module (untracked): `$ echo "CONF = {}" > conf.py`. this
  dict must contain the following case-sensitive keys, as well as corresponding
  values appropriate to your env:
 * `RR_SECRET_KEY`
 * `RR_DB_NAME`
 * `RR_DB_USER`
 * `RR_DB_PASSWORD`
 * `RR_SOCIAL_AUTH_FACEBOOK_KEY`
 * `RR_SOCIAL_AUTH_FACEBOOK_SECRET`
 * `RR_SOCIAL_AUTH_GOOGLE_OAUTH2_KEY`
 * `RR_SOCIAL_AUTH_GOOGLE_OAUTH2_SECRET`
 * `RR_SOCIAL_AUTH_TWITTER_KEY`
 * `RR_SOCIAL_AUTH_TWITTER_SECRET`
 * `RR__NY_TIMES_API_KEY`
 * `RR_EMAIL_HOST`
 * `RR_EMAIL_HOST_PASSWORD`
 * `RR_EMAIL_HOST_USER`
* `pip install virtualenv`
* `mkdir ~/.venv/` (if necessary)
* `which python3`
* `virtualenv ~/.venv/respondreact -p /usr/local/bin/python3 [use path to python from previous command]`
* `source ~/.venv/respondreact/bin/activate`
* MySQL settings:
* - create a database called respondreact: `CREATE DATABASE respondreact`
* - preload the db with a backup mysql -u root -p respondreact > mysql_backups/respondreact.sql
* Or use the sqlite db settings
* `pip install -r requirements.txt`
* `python manage.py migrate`
* `python manage.py runserver 8100`
* `python manage.py syncdb`

## Media files (images) settings:
* From the PROJECT root (above respond-react and respond-react-api), run `python -m SimpleHTTPServer 3100`

## Backend hosts file entries:
* `127.0.0.1 api.respondreact.com`
* `127.0.0.1 media.respondreact.com`
