#!/usr/bin/env bash
# exit on error
set -o errexit

# Install gems
bundle install

# Precompile assets
bundle exec rake assets:precompile

# Clean up old assets
bundle exec rake assets:clean

# Run database migrations
bundle exec rake db:migrate

# Seed the database
bundle exec rake db:seed
