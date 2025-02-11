source "https://rubygems.org"

ruby "3.2.4"

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

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
