require 'rubygems'
require 'spork'
require 'rspec/core'

Spork.prefork do
  Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
  RSpec.configure do |config|
    config.expect_with :rspec do |c|
      c.syntax = :expect
    end
    config.mock_with :rspec
    config.extend Macros
  end

end

Spork.each_run do
  # Requires supporting files with custom matchers and macros, etc,
  # in ./support/ and its subdirectories.
  require "#{File.dirname(__FILE__)}/../lib/pivotal_to_pdf"
  Dir["#{File.dirname(__FILE__)}/../lib/**/*.rb"].each {|f| require f}
end
