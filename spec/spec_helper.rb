require 'rspec'
require 'rack/test'
require 'simplecov'
require 'coveralls'


SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
SimpleCov::Formatter::HTMLFormatter,
Coveralls::SimpleCov::Formatter
]
SimpleCov.start
Coveralls.wear!

require File.join(File.dirname(__FILE__), '..', 'machine.rb')
require File.join(File.dirname(__FILE__), '..', 'main.rb')


RSpec.configure do |config|
  config.include Rack::Test::Methods
end


