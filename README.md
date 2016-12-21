## KMS Catalog

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

## Contributing

Please follow [CONTRIBUTING.md](CONTRIBUTING.md).
