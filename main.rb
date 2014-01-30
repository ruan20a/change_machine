require 'pry'
require_relative 'machine'

m = Machine.new
a = m.convert_cents(75)
puts a
# a = m.get_conversion_type
# puts m.is_currency