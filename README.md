## KMS Catalog
[![Build Status](https://travis-ci.org/webgradus/kms_catalog.svg?branch=master)](https://travis-ci.org/webgradus/kms_catalog)

Provides catalog functionality for KMS website - Categories, Products, Variants, Product Properties.

## Installation

1. Add to Gemfile:

        gem "kms_catalog"
        # or for edge version:
        gem "kms_catalog", github: "webgradus/kms_catalog"

2. Run generator:

        bundle exec rails g kms_catalog:install

3. Copy migrations:

        bundle exec rails kms_catalog:install:migrations

4. Migrate:

        bundle exec rails db:migrate

5. Recompile assets (for production):

        bundle exec rails assets:precompile

6. Restart KMS instance

## Getting started
Please watch this video to start using KMS Catalog:

[![Getting started with KMS Catalog extension](http://img.youtube.com/vi/fT5sEgn6r5s/0.jpg)](https://youtu.be/fT5sEgn6r5s "Getting started with KMS Catalog extension")

## Contributing

Please follow [CONTRIBUTING.md](CONTRIBUTING.md).
