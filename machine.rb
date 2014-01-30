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



end


