source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
gem 'rails', '5.1.0.rc2'
gem 'mysql2', '~> 0.3.21'
gem 'puma'
gem 'representable'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'responders'
gem 'multi_json'
gem 'paranoia'

group :development, :test do
  gem 'simplecov'
  gem 'byebug', platform: :mri
  gem 'dotenv-rails'
  gem 'faker'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :development do
  gem 'listen'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen'
end

group :test do
  gem 'database_cleaner', :github => 'DatabaseCleaner/database_cleaner' #todo: remove github once 1.6.0 is launched (deprecation warnings workaround)
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
