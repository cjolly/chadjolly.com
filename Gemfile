source 'http://rubygems.org'

gem 'rails', '~> 3.2.3'
gem 'haml-rails'
gem 'jquery-rails'
gem 'rack-canonical-host'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'compass-rails'
end

group :development do
  gem 'sqlite3'
end

group :test do
  gem 'rspec-rails'
  gem 'capybara'
end

group :production do
  gem 'pg'
  gem 'thin'
  gem 'newrelic_rpm'
end
