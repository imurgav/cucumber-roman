require 'rspec/expectations'

Given /^un conversor$/ do
  @convesor = Conversor.new
end

When /^le paso (\d+)$/ do |numero|
	@resultado =  @convesor.convertirromado(numero.to_i)
end

Then /^lo convierto a ([A-Z]*)/ do |valor_romano|
	@resultado.should == valor_romano
end

Given /^que el número arabigo es (\d+)$/ do |numero|
  @arabigo = numero.to_i
end

Given /^que (-?\d+) es un numero no convertible a romano$/ do |numero|
  @arabigo = numero.to_i
end

When /^convierto a romano$/ do
  @roman = @arabigo.to_roman
end

Then /^el resultado romano es ([IVXLCDM]+)$/ do |numero|
  @roman.should == numero
end

Then /^el resultado romano es nil$/ do
  @roman.should == nil
end

class Conversor
	def convertirromado(numero)

		romanos = ""

		romanos = (numero / 10) + "X" 

		romanos		

	end
end

class Fixnum
  ROMAN_ONES = ["I", "X", "C", "M"]
  ROMAN_FIVES = ["V", "L", "D", ""]
  
  def to_roman
    return nil if self < 1 || self >= 4000
    current = self
    [3,2,1,0].inject("") do |result, power|
      div, mod = current.divmod(10**power)
      current = mod
      result + digit_to_roman(div, power)
    end
  end
  
  def digit_to_roman(digit, scale)
    five_or_more, less_than_five = digit.divmod(5)
    case less_than_five
      when 4 then ROMAN_ONES[scale] + (five_or_more == 1 ? ROMAN_ONES[scale+1] : ROMAN_FIVES[scale])
      else ROMAN_FIVES[scale]*five_or_more + ROMAN_ONES[scale]*less_than_five
    end
  end
end

class String
  ROMAN_VALUES = {"M" => 1000, "D" => 500, "C" => 100, "L" => 50, "X" => 10, "V" => 5, "I" => 1}
  
  def from_roman
    integer = (self.chars.to_a << nil).each_cons(2).inject(0) do |result, digits|
      current_digit, next_digit = from_roman_letter(digits.first), from_roman_letter(digits.last).to_i
      return nil if current_digit.nil? || next_digit.nil?
      sign = (current_digit < next_digit) ? -1 : +1
      result += sign * current_digit
    end
    return integer if integer.to_roman == self
    nil
  end
  
  def from_roman_letter(value)
    return ROMAN_VALUES[value]
  end
end