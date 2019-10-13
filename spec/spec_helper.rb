require 'simplecov'
require 'simplecov-console'

require 'capybara/rspec'

require_relative './setup_test_database'
require_relative './database_helpers'

ENV['ENVIRONMENT'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

Capybara.app = ChitterApp

RSpec.configure do |config|
  config.before(:each) do
    DatabaseConnection.setup('chitter_test')
    setup_test_database
  end
end

# require 'features/web_helper'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
