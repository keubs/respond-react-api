#!/bin/bash

activate="${RR_VENV}/bin/activate"

git stash -q --keep-index
source ${activate} && python manage.py test --settings=untitled.settings.test
RESULT=$?
git stash pop -q

[ $RESULT -ne 0 ] && exit 1
exit 0
