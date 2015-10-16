# `travis-images-specs`

Spec runner for Travis images!

## Configuration

The `TRAVIS_TOKEN` env var must be set in order to make authenticated requests
to the Travis API.

## Usage

There are both a web application and script available for enqueueing spec
suites, available at `./app.rb` and `./enqueue-suites` respectively.

Running the script by passing languages as options will send seperate build
requests for ruby, python, and php., e.g.:

``` bash
bundle exec ./enqueue-suites ruby python php
```
