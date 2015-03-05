#!/bin/bash

# this script sends build requests for different build-images
# using the travis api.

# run this script by passing languages as options
# eg 'test_languages.sh ruby python php'
# will send 3 build requests, one for each language

set -e

langs=$@
url=https://api.travis-ci.org/requests


for sudo in "true false"; do
  for lang in $langs; do
    data='
      {
        "request": {
          "config": { "language": "'$lang'" },
          "sudo": "'$sudo'",
          "message": "Test language '$lang'",
          "repository": { "owner_name": "travis-ci", "name": "travis-images-specs" }
        }
      }
    '

    echo "Triggering requests for testing the $lang image"
    echo $(curl -s -X POST -H "Content-Type: application/json" -H "Authorization: token $TRAVIS_ACCESS_TOKEN" -d "$data" $url)
    echo $sudo
  done
done
