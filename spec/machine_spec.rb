require File.dirname(__FILE__) + '/..' + '/machine.rb'
require File.dirname(__FILE__) + '/spec_helper'

describe Machine do
  include Rack::Test::Methods
  let(:machine){
    Machine.new
  }

  describe "Machine Initial Attributes" do

    it "has a currency_set to store the currency => cent conversion" do
      expect(machine.currency_set).to eq({"penny"  => 1, "nickel" => 5, "dime" => 10, "quarter" => 25})
    end

    it "has a cents_set to store the cent => currency conversion" do
      expect(machine.cent_set).to eq({1  => "penny", 5 => "nickel", 10 => "dime", 25 => "quarter"})
    end

    it "is_currency is currently nil" do
      expect(machine.is_currency).to eq(nil)
    end

  end




end