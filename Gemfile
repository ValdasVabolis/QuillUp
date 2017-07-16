source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.0'

gem 'acts_as_votable', '~> 0.10.0'
gem 'bootstrap-sass', '3.3.7'
gem 'coffee-rails', '4.2.2'
gem 'devise', '4.3.0'
gem 'faker'
gem 'hirb', '0.7.3'
gem 'jbuilder', '2.7.0'
gem 'jquery-rails', '4.3.1'
gem 'puma', '3.7'
gem 'rails', '5.1.2'
gem 'sass-rails', '5.0.6'
gem 'turbolinks', '5.0.1'
gem 'uglifier', '3.2.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '2.13'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'sqlite3'
end

group :production do
  gem 'pg', '0.21.0'
end

group :development do
  gem 'listen', '3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '2.0.0'
  gem 'web-console', '3.3.0'
end

group :test do
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
