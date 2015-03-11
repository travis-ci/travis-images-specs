# travis-images-specs
Tests for Travis build images!

These tests check the standard build image to ensure that all components and packages are installed and (where possible) properly operational.

They are designed to be used by whoever is responsible for rolling out build images.

In order to test languages other than Ruby, and run tests where sudo privileges are not available, it is possible to use a shell script included in the /bin directory:

/bin/test_languages.sh

This script sends build requests for different build-images using a beta feature of the Travis api.
Run the script by passing languages as options eg:

```test_languages.sh ruby python php```

will send seperate build requests for ruby, python, and php, once with sudo set to true, once with sudo set to false.


