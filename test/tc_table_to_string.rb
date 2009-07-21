require "test/unit"
require "table"

class TestTableToString < Test::Unit::TestCase
	def test_empty_table
		t = Table.new
		assert_equal("", t.to_s)
	end

	def test_one_cell
		t = Table.new(["a"])
		assert_equal("a", t.to_s)
	end

	def test_one_row
		t = Table.new([1, 2, 3])
		assert_equal("123", t.to_s)
	end

	def test_rows
		t = Table.new([1,2,3],[4,5,6])
		assert_equal("123\n456", t.to_s)
	end

	def test_rows_different_length
		t = Table.new([1],[1,2,3,4],[1,2])
		assert_equal("1\n1234\n12", t.to_s)
	end

	def test_rows_with_newline
		t = Table.new(["ab\nc", "d", "e"],["f", "g", "h"]) 	
		assert_equal("ab\ncde\nfgh", t.to_s)
	end
end
