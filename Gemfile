source "https://rubygems.org"

ruby "3.2.2"

gem "rails", "~> 7.1.3", ">= 7.1.3.3"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false
gem 'rack-cors', require: 'rack/cors'
gem 'devise'
gem 'devise-jwt'
gem "redis", "~> 5.3"
gem "sidekiq", "~> 7.3"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
  gem 'rspec-rails', '~> 5.0'
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'database_cleaner-active_record'
end
