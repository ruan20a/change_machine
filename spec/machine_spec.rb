require 'stringio'
require File.dirname(__FILE__) + '/..' + '/machine.rb'
require File.dirname(__FILE__) + '/spec_helper'

describe Machine do
  include Rack::Test::Methods
  let(:machine){
    Machine.new
  }

  describe "machine initial attribute" do
    it "has default currency_set" do
      expect(machine.currency_set).to eq({"penny"  => 1, "nickel" => 5, "dime" => 10, "quarter" => 25})
    end

    it "has default cent_set" do
      expect(machine.cent_set).to eq({1  => "penny", 5 => "nickel", 10 => "dime", 25 => "quarter"})
    end

    it "has nil for is_currency" do
      expect(machine.is_currency).to eq(nil)
    end
  end

  describe "#get_conversion_type" do
    context "when input == \"currency\"" do
      it "sets is_currency to true" do
        STDIN = StringIO.new("currency")
        machine.get_conversion_type
        expect(machine.is_currency).to be(true)
      end
    end

    context "when input == \"cent\"" do
      it "sets is_currency to false" do
        STDIN = StringIO.new("cent")
        machine.get_conversion_type
        expect(machine.is_currency).to be(false)
      end
    end
  end

  describe "#set_conversion" do
    context "when input does not match" do
      it "sets is_currency to nil" do
        machine.set_conversion("gaga")
        expect(machine.is_currency).to be(nil)
      end
    end
  end

  describe "#get_specific_inputs" do
    context "when is_currency is false" do
      it "takes input" do
        machine.is_currency = false
        STDIN = StringIO.new("23")
        expect(machine.get_specific).to eq(23)
      end
    end

    # context "when is_currency is false" do
    #   machine.is_currency = false
    #   it {expects(machine.ask_specific)}.to eq("")
    # end
  end

  describe "#convert_cents" do
    it "should return a pattern string" do
      random = (1..100).to_a.sample
      output = machine.convert_cents(random)
      output.should match(/\D[a-z]/)
    end

    it "does not return 0 in a string" do
      random = (1..100).to_a.sample
      output = machine.convert_cents(random)
      output.should_not include "0"
    end


    it "returns the lowest # of coins" do
      output = machine.convert_cents(4)
      expect(output).to eq("4 penny")
    end

    it "returns the lowest # of coins" do
      output = machine.convert_cents(99)
      expect(output).to eq("3 quarter, 2 dime, 4 penny")
    end

  end

end