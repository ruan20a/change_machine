require 'pry'
require 'active_record'

class Machine

  attr_accessor :currency_set, :cent_set, :is_currency

  CURRENCY = {"penny"  => 1, "nickel" => 5, "dime" => 10, "quarter" => 25}
  CENT = {1  => "penny", 5 => "nickel", 10 => "dime", 25 => "quarter"}

  def initialize
    self.currency_set = Machine::CURRENCY
    self.cent_set = Machine::CENT
    self.is_currency = false
  end


end