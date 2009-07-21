require "test/unit"
require "table"

class TestTableFromString < Test::Unit::TestCase
	
	def test_empty_string
		t = Table.from_s("")
		assert_equal([], t.rows)
		assert_equal([], t.columns)
	end

	def test_space
		t = Table.from_s(" ")
		assert_equal([[" "]], t.rows)
	end
	
	def test_simple_string
		t = Table.from_s("abc")
		assert_equal([["a", "b", "c"]], t.rows)
	end

	def test_multiline_string
		t = Table.from_s("a\nb")
		assert_equal([["a"], ["b"]], t.rows)
	end

	def test_multiline_multichars_string
		t = Table.from_s("abc\ndef")
		assert_equal([["a", "b", "c"], ["d", "e", "f"]], t.rows)
	end

	def test_different_line_length
		t = Table.from_s("\nab\ncdef")
		assert_equal([[], ["a", "b"], ["c", "d", "e", "f"]], t.rows)
	end

end
