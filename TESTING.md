# Testing

Testing is performed in a variety of ways.

## Style

### Ruby

RuboCop is used to create consistent style across the code base.
See any overrides and exceptions in `.rubocop.yml` Additions to the overrides
should be considered very carefully and be accompanied by explanations.

### Chef

Foodcritic is run against the Chef code and will alert if any inconsistencies

## Spec

RSpec & ChefSpec attempt to exercise most behaviors. This has the benefit of
trying out code paths based on a variety of external attributes, such as
platform versions, to confirm and ensure that the desired resources are created.

See the `spec/` directory for more.

## Test

Test-Kitchen, the slowest of them all, will perform validation of executed
resources on a real system.

See `.kitchen.yml` for the basic directives and settings, which will default
to using Vagrant with Virtualbox.

Some tests will fail if invalid credentials are provided. See the file
`test/integration/data_bags/secrets/pertino_device_auth.json` for where you
would place a valid Network API Key.

### Docker

There is a `.kitchen.docker.yml` file provided, which will use Docker to run
images and tests. You can either copy this file to `.kitchen.local.yml` to
activate it, or set an environment variable for your session:
```bash
export KITCHEN_LOCAL_YAML=.kitchen.docker.yml
```
