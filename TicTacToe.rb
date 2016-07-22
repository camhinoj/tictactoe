class TicTacToe
	
	def initialize(name1, name2)
		@player1 = Player.new(name1, "X")
		@player2 = Player.new(name2, "O")
		@board = Board.new
	end

	def play
		puts "Player #{@player1.name} will go first"
		player_tracker = @player1
		loop do
			puts "Enter cell to place your token:"
			cell_placement = gets.chomp
			@board.add_token(player_tracker, cell_placement)
			@board.display
			if @board.check_win
				puts "Player #{player_tracker.name} has Won!!"
				return true
			else
				if player_tracker == @player1
					player_tracker = @player2
				else
					player_tracker = @player1
				end
			end
			puts "Player #{player_tracker.name}'s turn"
		end
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
			@column1 = [:cell1, :cell4, :cell7]
			@column2 = [:cell2, :cell5, :cell8]
			@column3 = [:cell3, :cell6, :cell9]
			@row1 = [:cell1, :cell2, :cell3]
			@row2 = [:cell4, :cell5, :cell6]
			@row3 = [:cell7, :cell8, :cell9]
			@diag1 = [:cell1, :cell5, :cell9]
			@diag2 = [:cell3, :cell5, :cell8]
			@rows = [@row1, @row2, @row3]
			@columns = [@column1, @column2, @column3]
			@diags = [@diag1, @diag2]
			init_display
		end

		def init_display
			puts ""
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
				puts ""
				puts ind == @rows.size - 1 ? " " : "---------"
			end
		end

		def display 
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
						print @cells[("cell"+(index + 1 + adder).to_s).intern]
					else
						print @cells[("cell"+(index + 1 + adder).to_s).intern] + " | " 
					end
				end
				puts
				puts ind == @rows.size - 1 ? " " : "---------"
			end
		end

		def add_token(player, cell)
			if @cells[("cell"+cell.to_s).intern] != " "
				raise StandardError
			else
				@cells[("cell"+cell.to_s).intern] = player.token
			end
		end

		def check_win
			@rows.each do |row|
				return true if check_array row
			end
			@columns.each do |column|
				return true if check_array column
			end
			@diags.each do |diag|
				return true if check_array diag
			end
			return false
		end

		def check_array(three_array)
			if three_array.all? { |cell| @cells[cell] == "X" }
				return true
			elsif three_array.all? { |cell| @cells[cell] == "O" }
				return true
			else
				return false
			end
		end
	end
end

tic = TicTacToe.new("Cam", "Kristen")
tic.play




