source 'https://rubygems.org'
ruby '2.2.4'

gem 'rails', '~> 5.0.0'
gem 'haml-rails'
gem 'sass-rails'
gem 'rack-canonical-host'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'stripe'
gem 'pg'

group :production do
  gem 'rails_12factor'
  gem 'unicorn'
  gem 'uglifier'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'dotenv'
end

group :test do
  gem 'capybara'
end
