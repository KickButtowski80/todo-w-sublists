########################################
########################################

# => Sources
source 'https://rubygems.org'
source 'http://insecure.rails-assets.org' # => (Heroku) https://github.com/tenex/rails-assets/issues/325

# => GitHub
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

########################################
########################################

# => Ruby
# => https://github.com/cantino/huginn/blob/master/Gemfile#L4
ruby [RUBY_VERSION, '2.5.1'].min


# => Rails
gem 'rails', '~> 5.2.0'

# => Server
# => Default dev development for Rails 5 but still needs the gem....
# => https://richonrails.com/articles/the-rails-5-0-default-files
gem 'puma', groups: [:development, :staging] # => Production will use phusion with nginx

########################################
########################################

# Assets / Frontend
gem 'sass-rails',   '~> 5.0'
gem 'uglifier',     '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks',   '~> 5'
gem 'jbuilder',     '~> 2.5'
gem 'bootsnap',     '>= 1.1.0', require: false

########################################
########################################

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'sqlite3'
end

group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

group :staging, :production do
  gem 'pg', '~> 1.0'
end

########################################
########################################

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data'     if Gem.win_platform?
gem 'wdm', '>= 0.1.0' if Gem.win_platform?
gem 'rubocop'
gem 'bootstrap', '~> 4.1', '>= 4.1.1'
gem 'jquery-rails'
gem "font-awesome-rails"
gem 'haml', '~> 5.0', '>= 5.0.3'
