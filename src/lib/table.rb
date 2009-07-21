class Table

	def initialize(*rows)
		@rows = rows.clone
	end

	def rows
		@rows.clone
	end

	def columns
		(0..longest_row_length-1).reduce([]) do |cols, row_index|
			cols.push(@rows.reduce([]) { |col, row| col.push(row[row_index]) })
		end || []
	end

	def add_row(row)
		@rows.push(row)
	end

	def add_column(col)
		(col.length - @rows.length).times { @rows.push([]) }
		pos = longest_row_length
		col.each_with_index do |elem, index|
			@rows[index] ||= []
			@rows[index][pos] = elem
		end	
	end

	def append_right_table(table)
		t = self.clone
		table.columns.each { |col| t.add_column(col) }
		return t	
	end

	def to_s
		@rows.map { |row| row.join }.join("\n")
	end

	def self.from_s(str)
		self.new(*str.split("\n").map { |line| line.split("") })
	end

	private 
		def longest_row_length
			@rows.map { |row| row.length }.max || 0
		end

end
