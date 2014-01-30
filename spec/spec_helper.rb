require 'rspec'
require 'rack/test'

require File.dirname(__FILE__) + '/..' + '/main.rb'
require File.dirname(__FILE__) + '/spec_helper'

RSpec.configure do |config|
  config.include Rack::Test::Methods
end

# fail ArgumentError, "Pieces must be a single character: #{piece}" unless piece.length == 1