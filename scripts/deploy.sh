#!/bin/bash

if [[ $TRAVIS_BRANCH == 'site' ]] ; then
  cd _site
  git init

  git config user.name "inmycomfyhoodie"
  git config user.email "chloe.minkyung.k@gmail.com"
  git add .
  git commit -m "Deploy"

  # We redirect any output to
  # /dev/null to hide any sensitive credential data that might otherwise be exposed.
  git push --force --quiet "https://${GH_TOKEN}@github.com/inmycomfyhoodie/inmycomfyhoodie.github.io.git" main:main > /dev/null 2>&1
else
  echo 'Invalid branch. You can only deploy from site.'
  exit 1
fi
