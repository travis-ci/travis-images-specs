# travis-images-specs
Tests for Travis build images!

These test check the standard build image to ensure that all components and packages are installed and (where possible) properly operational.

In order to test languages other than Ruby, it is possible to use a shell script included in the /bin directory:

/bin/test_languages.sh

This script sends build requests for different build-images using a beta feature of the Travis api.
Run the script by passing languages as options eg:

```test_languages.sh ruby python php```

will send 3 build requests, one for ruby, python, and php.
