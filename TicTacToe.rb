class TicTacToe
	
	def initialize(name1, name2)
		@Player1 = Player.new(name1, "X")
		@Player2 = Player.new(name2, "O")
		@board = Board.new
	end

	Player = Struct.new(:name, :token)

	class Board
		
		def initialize
			@cells = Hash.new
			i = 1
			9.times do
				@cells[("cell"+i.to_s).intern] = " "
				i += 1
			end
			@column1 = [@cells[:cell1], @cells[:cell4], @cells[:cell7]]
			@column2 = [@cells[:cell2], @cells[:cell5], @cells[:cell8]]
			@column3 = [@cells[:cell3], @cells[:cell6], @cells[:cell9]]
			@row1 = [@cells[:cell1], @cells[:cell2], @cells[:cell3]]
			@row2 = [@cells[:cell4], @cells[:cell5], @cells[:cell6]]
			@row3 = [@cells[:cell7], @cells[:cell8], @cells[:cell9]]
			@diag1 = [@cells[:cell1], @cells[:cell5], @cells[:cell9]]
			@diag2 = [@cells[:cell3], @cells[:cell5], @cells[:cell8]]
			@rows = [@row1, @row2, @row3]
			init_display
		end

		def init_display
			puts
			@rows.each_with_index do |row, ind|
				if ind == 0
					adder = 0
				elsif ind == 1
					adder = 3
				else
					adder = 6
				end
				row.each_with_index do |cell, index|
					if index == row.size - 1
						print (index + 1 + adder)
					else
						print (index + 1 + adder).to_s + " | " 
					end
				end
				puts
				puts ind == @rows.size - 1 ? " " : "---------"
			end
		end

	end
end

tic = TicTacToe.new("Cam", "Kristen")




