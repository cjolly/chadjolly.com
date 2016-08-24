source 'https://rubygems.org'
ruby '2.2.3'

gem 'rails', '~> 4.1.0'
gem 'haml-rails'
gem 'sass-rails'
gem 'rack-canonical-host'
gem 'coffee-rails'
gem 'jquery-rails'

group :production do
  gem 'rails_12factor'
  gem 'unicorn'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'dotenv-rails'
end

group :test do
  gem 'capybara', '~> 2.4.1'
end
