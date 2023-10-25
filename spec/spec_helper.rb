require 'factory_bot_rails'
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  # assertions if you prefer.
  config.expect_with :rspec do |expectations|
  end
end