# stolen from @awead
gem_group :development, :test do
  gem 'byebug', platform: :mri
  gem 'pry-byebug'
  gem 'pry-rails'
end

gem_group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'flog'
  gem 'web-console', '>= 3.3.0'
  gem 'xray-rails'
end

gem_group :test do
  gem 'capybara'
  gem 'coveralls', require: false
  gem 'database_cleaner'
  gem 'launchy'
  gem 'rspec'
  gem 'rspec-its'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'webdrivers'
end

run "bundle install"

environment 'config.generators { |generator| generator.test_framework :rspec }'

file '.rubocop.yml', <<-CODE
inherit_gem:
  niftany: niftany_rubocop.yml

inherit_from:
  - .rubocop_todo.yml

AllCops:
  TargetRubyVersion: 2.6.3
  Exclude:
    - 'db/**/*'
    - 'script/**/*'
    - 'tmp/**/*'
    - 'vendor/**/*'
    - 'bin/**/*'
    - 'node_modules/**/*'
CODE

run 'touch .rubocop_todo.yml'

run 'rm -Rf test'

# Rails seems to use the wrong format for ruby-version files
run "sed -i '' 's/ruby-//g' .ruby-version"

after_bundle do
  generate "rspec:install"
  run "bundle exec rubocop -a"
  git :init
  git add: "."
  git commit: %Q{ -m 'Initial Rails application setup' }
end

