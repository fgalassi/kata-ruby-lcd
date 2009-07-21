require "test/unit"
require "table.rb"

class TestTable < Test::Unit::TestCase
	def test_empty_table
		t = Table.new
		assert_equal([], t.columns)
		assert_equal([], t.rows)
	end

	def test_empty_row
		t = Table.new([])
		assert_equal([[]], t.rows)
		assert_equal([], t.columns)
	end

	def test_row
		t = Table.new([1, 2, 3])
		assert_equal([[1, 2, 3]], t.rows)
		assert_equal([[1], [2], [3]], t.columns)
	end

	def test_rows
		t = Table.new([1, 2, 3], ["a", "b", "c"])
		assert_equal([[1, 2, 3], ["a", "b", "c"]], t.rows)
		assert_equal([[1, "a"], [2, "b"], [3, "c"]], t.columns)
	end

	def test_rows_different_length
		t = Table.new([1, 2], ["a", "b", "c", "d"])
		assert_equal([[1, "a"], [2, "b"], [nil, "c"], [nil, "d"]], t.columns)
	end
	
	def test_add_row_to_empty
		t = Table.new
		t.add_row([1, 2, 3])
		assert_equal([[1, 2, 3]], t.rows)
	end

	def test_add_row
		t = Table.new([1, 2, 3])
		t.add_row(["a", "b", "c"])
		assert_equal([[1, 2, 3], ["a", "b", "c"]], t.rows)
	end

	def test_add_empty_column_to_empty
		t = Table.new
		t.add_column([])
		assert_equal([], t.rows)
		assert_equal([], t.columns)
	end

	def test_add_empty_column
		t = Table.new([1, 2, 3])
		t.add_column([])
		assert_equal([[1, 2, 3]], t.rows)
		assert_equal([[1], [2], [3]], t.columns)
	end
		
	def test_add_column_to_empty
		t = Table.new
		t.add_column([1, 2, 3])
		assert_equal([[1], [2], [3]], t.rows)
		assert_equal([[1, 2, 3]], t.columns)
	end

	def test_add_column_same_rows
		t = Table.new([1, 2, 3], [4, 5, 6])
		t.add_column(["a", "b"])
		assert_equal([[1, 2, 3, "a"], [4, 5, 6, "b"]], t.rows)
		assert_equal([[1, 4], [2, 5], [3, 6], ["a", "b"]], t.columns)
	end

	def test_add_column_less_rows
		t = Table.new([1, 2, 3], [4, 5, 6])
		t.add_column(["a", "b", "c"])
		assert_equal([[1, 2, 3, "a"], [4, 5, 6, "b"], [nil, nil, nil, "c"]], t.rows)
		assert_equal([[1, 4, nil], [2, 5, nil], [3, 6, nil], ["a", "b", "c"]], t.columns) 
	end

	def test_add_column_more_rows
		t = Table.new([1, 2, 3], [4, 5, 6])
		t.add_column(["a"])
		assert_equal([[1, 2, 3, "a"], [4, 5, 6]], t.rows)
		assert_equal([[1, 4], [2, 5], [3, 6], ["a", nil]], t.columns)
	end

	def test_append_right_table
		t = Table.new([1, 2, 3], [4, 5, 6])
		t2 = Table.new(["a", "b", "c"], ["d", "e", "f"])
		tsum = t.append_right_table(t2)
		assert_equal([[1, 2, 3, "a", "b", "c"], [4, 5, 6, "d", "e", "f"]], tsum.rows)
	end
end
