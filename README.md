## Build & Backend setup (REQUIRES PYTHON 3)
* `pip install virtualenv`
* `mkdir ~/.venv/` (if necessary)
* `which python3`
* `virtualenv ~/.venv/untitled -p /usr/local/bin/python3 [use path to python from previous command]` 
* `source ~/.venv/untitled/bin/activate`
* `pip install -r back/requirements.txt`
* `cd back`
* `python manage.py runserver 8100`
* `python manage.py syncdb`