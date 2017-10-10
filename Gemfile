source 'https://rubygems.org'

ruby '2.4.2'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'acts_as_votable', '~> 0.10.0'
gem 'airbrake', '~> 6.2'
gem 'annotate'
gem 'autoprefixer-rails'
gem 'autosize'
gem 'carrierwave'
gem 'cloudinary'
gem 'colorize'
gem 'devise', '4.3.0'
gem 'faker'
gem 'font-awesome-rails'
gem 'handlebars_assets'
gem 'hirb', '0.7.3'
gem 'jbuilder', '2.7.0'
gem 'jquery-rails', '4.3.1'
gem 'mini_magick'
gem 'puma', '3.7'
gem 'rails', '~> 5.1.2'
gem 'recaptcha', require: 'recaptcha/rails'
gem 'redis'
gem 'sass-rails', '5.0.6'
gem 'slack-notifier'
gem 'turbolinks', '5.0.1'
gem 'uglifier', '3.2.0'
gem 'underscore-rails'
gem 'will_paginate', '~> 3.1.0'

group :development, :test do
  gem "database_cleaner"
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara"
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'guard-rspec', '~> 4.7', require: false
  gem 'pry'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'sqlite3'
  gem 'timecop'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'guard-livereload', '~> 2.5', require: false
  gem 'letter_opener'
  gem 'listen', '3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '2.0.0'
  gem 'web-console', '3.3.0'
end

group :production do
  gem 'pg', '0.21.0'
  gem 'newrelic_rpm'
end

group :test do
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
