source 'https://rubygems.org'

ruby '2.2.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use postgresql as the database for Active Record
gem 'pg'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# Making it easy to serialize models for client-side use
gem 'active_model_serializers', '~> 0.9.3'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Rspec to test
  gem 'rspec-rails', '~> 3.3.3'
  # Progress bar for rspec
  gem 'fuubar', '~> 2.0.0'
  # Awesome matchers to use on rspec
  gem 'shoulda-matchers', '~> 2.8.0', require: false
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :development, :test, :staging do
  # Factory to create test data
  gem 'factory_girl_rails', '~> 4.5.0'
  # Helping to generate fake data
  gem 'faker', '~> 1.5.0'
end
