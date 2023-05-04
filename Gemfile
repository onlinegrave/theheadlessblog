source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
ruby "2.7.5"
gem "rails", "~> 7.0.4", ">= 7.0.4.3"
gem "sprockets-rails"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem "sassc-rails"
group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end
group :development do
  gem "web-console"
  gem 'debase', '~> 0.2.4'
  gem 'ruby-debug-ide', '~> 0.7.3'
end
group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
gem "tailwindcss-rails", "~> 2.0"
gem "github-markup", "~> 4.0"
gem "commonmarker", "~> 0.23.9"
