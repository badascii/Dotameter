source 'https://rubygems.org'

ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use postgresql as the database for Active Record
gem 'pg'

gem 'newrelic_rpm'

# Wraps the Angular.js library for use in Rails 3.1 and above. Assets will minify automatically during production.
gem 'angularjs-rails'

# Allows for use of db push/pull
gem 'heroku'


################################################################################

# Figaro provides a clean and simple way to configure your app and keep the private stuff… private
gem 'figaro'

# Makes http fun again!
gem 'httparty'

gem 'active_model_serializers'

################################################################################


# Haml-rails provides Haml generators for Rails
gem 'haml-rails'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'


# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :test do
  gem 'rspec-rails'
  gem 'guard-rspec', require: false
  gem 'capybara'
  gem 'vcr'
  gem 'webmock'

  # For Guard testing
  gem 'rb-fsevent', require: false
  gem 'growl', require: false
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'jazz_hands'
  gem 'meta_request'
end

group :development, :test do
  gem 'faker'
  gem 'jasmine'
  gem 'guard-jasmine', require: false
end


group :production do
  # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
  gem 'turbolinks'

  gem 'rails_12factor'

  # A simple database agnostic import/export app to transfer data to/from a remote database.
  gem 'taps'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem 'mechanize'
gem 'nokogiri'
gem 'json'
# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
