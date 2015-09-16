# travis-images-specs

Specs for Travis build images!

These tests check the standard build image to ensure that all components and
packages are installed and (where possible) properly operational.

They are designed to be used by whoever is responsible for rolling out build
images.

In order to test languages other than Ruby, and run tests where sudo privileges
are not available, it is possible to use the `enqueue-suites` script included in
the `./bin` directory.

This script sends build requests for different build images using the Travis
API's repo requests resource.

## Configuration

The `TRAVIS_TOKEN` env var must be set in order to make authenticated requests
to the Travis API.

## Usage

Running the script by passing languages as options will send seperate build
requests for ruby, python, and php., e.g.:

``` bash
bundle exec ./bin/enqueue-suites ruby python php
```
