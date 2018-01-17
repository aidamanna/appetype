source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'bcrypt', '~> 3.1.7'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'bootstrap-will_paginate', '~> 1.0'
gem 'cancancan', '~> 2.0'
gem 'coffee-rails', '~> 4.2'
gem 'dotenv'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'pg'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.0.1'
gem 'rails_12factor'
gem 'rest-client'
gem 'rubocop', require: false
gem 'sass-rails', '~> 5.0'
gem 'sendgrid-ruby'
gem 'turbolinks', '~> 5'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'uglifier', '>= 1.3.0'
gem 'will_paginate', '~> 3.1'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec'
  gem 'rspec-rails'
  gem 'simplecov', require: false
  gem 'webmock'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end
