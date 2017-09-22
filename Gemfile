source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem "rails", "~> 5.1.3"
gem "mysql2", ">= 0.3.18", "< 0.5"
gem "puma", "~> 3.7"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"

gem "coffee-rails", "~> 4.2"
gem "jbuilder", "~> 2.5"
gem "config"
gem "figaro"
gem "slim"
gem "devise"
gem "omniauth-facebook"
gem "koala"
gem "kaminari"
gem "carrierwave"
gem "activemodel-serializers-xml"
gem "draper", "3.0.0"
gem "faraday"
gem "jquery-rails"
gem "ransack"

gem "capistrano"
gem "capistrano3-puma"
gem "capistrano-rails", require: false
gem "capistrano-bundler", require: false
gem "capistrano-rbenv"

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "rails-erd"
end

group :development, :test do
  gem "awesome_print"
  gem "rspec"
  gem "rspec-rails"
  gem "rspec-collection_matchers"
  gem "better_errors"
  gem "guard-rspec", require: false
  gem "database_cleaner"
  gem "pry-rails"
  gem "factory_girl_rails"
  gem "faker"
  gem "shoulda"
end
