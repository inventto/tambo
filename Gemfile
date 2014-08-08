source 'https://rubygems.org'
ruby '2.1.2'

gem "sqlite3"
gem "rails_admin"
gem "paperclip"
gem 'rails',                  '4.1.4'
gem 'puma',                   '2.8.2'
gem 'secure_headers',         '1.2.0'
gem 'jquery-rails',           '3.1.1'
gem 'turbolinks',             '2.2.2'
gem 'jbuilder',               '2.1.1'
gem 'slim-rails',             '2.1.5'
gem 'pg',                     '0.17.1'
gem 'sass-rails',             '4.0.3'
gem 'coffee-rails',           '4.0.1'
gem 'uglifier',               '2.5.1'
gem 'simple_form',            '3.1.0.rc1'
gem 'flutie',                 '2.0.0'
gem 'bourbon',                '3.2.3'
gem 'neat',                   '1.5.1'
gem 'bitters',                '0.10.0'
gem 'refills',                '0.0.2'

group :production, :staging do
  gem 'rails_12factor',       '0.0.2'
  gem 'rack-canonical-host',  '0.1.0'
  gem 'rack-timeout',         github: 'kch/rack-timeout', ref: '83ca9f5141c1fdcb626820b1601c406e3a3a560a'
  gem 'newrelic_rpm',         '3.9.0.229'
  gem 'rollbar',              '0.13.1'
end

group :development do
  gem 'spring',               '1.1.3'
  gem 'foreman',              '0.74.0'
  gem 'jumpup',               '0.0.5'
  gem 'jumpup-heroku',        '0.0.5'
  gem 'better_errors',        '1.1.0'
  gem 'binding_of_caller',    '0.7.2'
  gem 'letter_opener',        '1.2.0'
  gem 'bullet',               '4.11.3'
  gem 'quiet_assets',         '1.0.3'
end

group :test do 
  gem 'shoulda-matchers',     '2.6.1', require: false
  gem 'shoulda'
  gem 'simplecov',            '0.8.2', require: false
  gem 'email_spec',           '1.6.0'
  gem 'capybara',             '2.4.1'
  gem 'selenium-webdriver'
  gem 'poltergeist',          '1.5.1'
  gem 'vcr',                  '2.9.2'
  gem 'webmock',              '1.18.0'
  gem 'database_cleaner',     '1.3.0'
  gem 'autotest-rails'
  gem 'ZenTest'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails',   '4.4.1'
  #gem 'pry-rails',            '0.3.2'
  gem 'dotenv-rails',         '0.11.1'
  gem 'awesome_print',        '1.2.0'
end
