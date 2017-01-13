#!/bin/bash

activate="${HOME}/.venv/rr/bin/activate"
db_name="respondreact"
pm="python manage.py"
port="8100"
prefix="RR:"

build() {
  echo "${prefix} build started" && dropdb ${db_name} && createdb ${db_name}
  if makemigrations; then
    if migrate; then
      if test; then
        echo "${prefix} build finished"
      fi
    fi
  fi
}

makemigrations() {
  echo "${prefix} makemigrations started" && ${pm} makemigrations && echo "${prefix} makemigrations finished"
}

migrate() {
  echo "${prefix} migrate started" && ${pm} migrate && echo "${prefix} migrate finished"
}

runserver() {
  echo "${prefix} runserver started" && ${pm} runserver ${port} && echo "${prefix} runserver finished"
}

test() {
  echo "${prefix} test started" && ${pm} test && echo "${prefix} test finished"
}

source $activate
if ${1}; then exit 0; else exit 1; fi
