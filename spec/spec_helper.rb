# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
Dir["#{File.dirname(__FILE__)}/../lib/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec
  # out = ENV['CC_BUILD_ARTIFACTS'] || "#{Rails.root}"
  # config.output_stream = File.open("#{out}/UnitTests/index.html", "w") if config.formatter_class.name =~ /HtmlFormatter/


  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, comment the following line or assign false
  # instead of true.
end
