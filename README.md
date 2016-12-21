## KmsCatalog

## Installation

1. Add to Gemfile:

        gem "kms_catalog", git: "https://gitlab.com/webgradus/kms_catalog.git"

2. Run generator:

        bundle exec rails g kms_catalog:install

3. Copy migrations:

        bundle exec rake kms_catalog:install:migrations

4. Migrate:

        bundle exec rake db:migrate

5. Recompile assets:

        bundle exec rake assets:precompile

6. Restart KMS instance
