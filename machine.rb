require 'pry'
require 'active_record'
require 'active_support/inflector'

class Machine

  attr_accessor :currency_set, :cent_set, :is_currency, :input

  CURRENCY = {"penny"  => 1, "nickel" => 5, "dime" => 10, "quarter" => 25}
  CENT = {25 => "quarter", 10 => "dime", 5 => "nickel", 1  => "penny"}

  def initialize
    self.currency_set = Machine::CURRENCY
    self.cent_set = Machine::CENT
    self.is_currency = nil
  end

  def ask(question) #TODO add test
    puts(question)
    STDIN.gets.chomp.downcase
  end

  def get_conversion_type #first question
    while @is_currency.nil? #TODO figureout best way to test TODO
      input = ask("Do you want to convert currency or cent? (Input \'currency\' or \'cent\')")
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

  def get_specific #2nd question
    input = ""
    if @is_currency
      input = ask("Enter your currencies for conversion:")
    else
      input = ask("Enter num of cents for conversion")
    end
    input = modify(input)
  end

  def modify(input) #to get the input in the right format
    if @is_currency
      #identify plurals and replace
    else
      input.gsub!(/\D/,"") #isolate for digits only
      input.to_i
    end
  end


  def convert_cents(number)
    output=[]
    while number > 0
      @cent_set.keys.sort.reverse.each do |divisor|
        currency = @cent_set[divisor]
        quotient, number = number.divmod(divisor)
        output << "#{quotient} #{currency}" if quotient > 0
      end
    end
    output.join(", ")
  end










end