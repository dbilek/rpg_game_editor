source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.0.4'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'devise', '~> 4.2'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'jquery-rails'

gem 'carrierwave', '~> 0.11.2'
gem 'mini_magick', '~> 4.5', '>= 4.5.1'
gem 'remotipart', '~> 1.2', '>= 1.2.1'

group :development do
  gem 'rspec-rails', '~> 3.4', '>= 3.4.2'
  gem 'byebug', platform: :mri
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '~> 2.7', '>= 2.7.1'
  gem 'factory_girl_rails', '~> 4.7'
  gem 'database_cleaner', '~> 1.5', '>= 1.5.3'
  gem 'guard-rspec', '~> 4.7', '>= 4.7.3', require: false
  gem 'poltergeist', '~> 1.10'
  gem 'phantomjs', :require => 'phantomjs/poltergeist'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
