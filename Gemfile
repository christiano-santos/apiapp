source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.3.3'

# devise
gem 'devise'
#devise auth token
gem 'devise_token_auth'
#rack cors
gem 'rack-cors'
#rack atack
gem 'rack-attack'
#CarrierWave 
gem 'carrierwave', '~> 1.0'
gem 'carrierwave-base64'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
#i18n
gem 'rails-i18n', '~> 5.1' # For 5.0.x, 5.1.x and 5.2.x
gem 'devise-i18n'

#navegador em modo texto
gem 'watir', '~> 6.14'
#parser html, css, xml etc
gem 'nokogiri', '~> 1.8', '>= 1.8.4'
#Gem para navegação, carrega o open-uri e nokogiri
gem 'mechanize', '~> 2.7', '>= 2.7.5'
#download de imagens
gem 'watir-get-image-content', '~> 0.0.4'
#gem 'whenever', require: false
gem 'selenium-webdriver'
gem 'chromedriver-helper'

# ⚡ A Scope & Engine based, clean, powerful, customizable and sophisticated paginator for Ruby webapps https://github.com/amatsuda
gem 'kaminari'
# Link header pagination for Rails and Grape APIs. 
gem 'api-pagination'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rails-erd'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'whenever', require: false
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
