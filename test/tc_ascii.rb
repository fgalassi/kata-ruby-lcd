require "test/unit"
require "ascii"

class TestAscii < Test::Unit::TestCase
	def test_draw_zero_size_one
		a = Ascii.from_char("0")
		expected = <<ZERO_ONE.chomp
 - 
| |
   
| |
 - 
ZERO_ONE
		assert_equal(expected, a.draw(1))
	end

	def test_draw_zero_size_two
		a = Ascii.from_char("0")
		expected = <<ZERO_TWO.chomp
 -- 
|  |
|  |
    
|  |
|  |
 -- 
ZERO_TWO
 		assert_equal(expected, a.draw(2))
	end
	
	def test_draw_one_size_one
		a = Ascii.from_char("1")
		expected = <<ONE_ONE.chomp
   
 | 
   
 | 
   
ONE_ONE
 		assert_equal(expected, a.draw(1))
	end
	
	def test_draw_one_size_two
		a = Ascii.from_char("1")
		expected = <<ONE_TWO.chomp
   
 | 
 | 
   
 | 
 | 
   
ONE_TWO
 		assert_equal(expected, a.draw(2))
	end

	def test_draw_two_size_one
		a = Ascii.from_char("2")
		expected = <<TWO_ONE.chomp
 - 
  |
 - 
|  
 - 
TWO_ONE
 		assert_equal(expected, a.draw(1))
	end
	
	def test_draw_two_size_two
		a = Ascii.from_char("2")
		expected = <<TWO_TWO.chomp
 -- 
   |
   |
 -- 
|   
|   
 -- 
TWO_TWO
 		assert_equal(expected, a.draw(2))
	end
end
