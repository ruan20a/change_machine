require 'debugger'
require 'active_record'
require 'active_support/inflector'

class Machine

  attr_accessor :currency_set, :cent_set, :is_currency

  CURRENCY = {"penny"  => 1, "nickel" => 5, "dime" => 10, "quarter" => 25}
  CENT = {25 => "quarter", 10 => "dime", 5 => "nickel", 1  => "penny"}

  def initialize
    self.currency_set = Machine::CURRENCY
    self.cent_set = Machine::CENT
    self.is_currency = nil
  end

  def get_conversion_type
    while @is_currency.nil? #TODO figureout best way to test TODO
      print "Do you want to convert currency or cent? (Input \'currency\' or \'cent\')"
      input = STDIN.gets.chomp #dont use ! with STDIN
      set_conversion(input)
    end
  end

  def set_conversion(input)
    if input == "currency" || input == "cent"
      @is_currency = (input == "currency")? true:false
    else
      @is_currency = nil
    end
  end


end


