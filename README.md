## Build & Backend setup
# Requirements:
* PYTHON 3.4.1 https://www.python.org/downloads/release/python-341/
* MySQL
* pip (should come with python)
* `pip install virtualenv`
* `mkdir ~/.venv/` (if necessary)
* `which python3`
* `virtualenv ~/.venv/respondreact -p /usr/local/bin/python3 [use path to python from previous command]` 
* `source ~/.venv/respondreact/bin/activate`
* create a database called respondreact: `CREATE DATABASE respondreact'`
* preload the db with a backup mysql -u root -p respondreact > mysql_backups/respondreact.sql
* `pip install -r requirements.txt`
* `python manage.py runserver 8100`
* `python manage.py syncdb`