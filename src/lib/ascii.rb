require "table"

class Ascii < Table
	
	alias_method :+, :append_right_table

	EMPTY = self.new
	ASCII_DIR = File.join(File.dirname(__FILE__), "ascii")

	def self.from_char(char)
		self.from_s(IO.read("#{ASCII_DIR}/#{char}.txt"))
	end

	def draw(size = 1)
		wider_table = Ascii.new
		higher_table = Ascii.new
		columns.each do |col|
			(col.include?("-") ? size : 1).times { wider_table.add_column(col) }
		end
		wider_table.rows.each do |row|
			(row.include?("|") ? size : 1).times { higher_table.add_row(row) }
		end
		return higher_table.to_s
	end
end
