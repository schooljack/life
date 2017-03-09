# Assume a fixed size board, eg 80 columns by 20 rows
require "pry"

class Board
	BOARD_WIDTH = 80
	BOARD_HEIGHT = 20
	def initialize
		@board = Hash.new
		for i in 0..BOARD_HEIGHT do 
			for j in 0..BOARD_WIDTH do
				@board[[i,j]] = Cell.new
			end
		end
	end

	def evolve
		for i in 0..BOARD_HEIGHT do 
			for j in 0..BOARD_WIDTH do
				calculate_neighbours(i,j)
			end
		end
	end

	def calculate_neighbours y_coord, x_coord
				# binding.pry
		# neightbours are 
		# y-1 x-1 
		# y-1 x-0
		# y-1 x+1
		# y-0 x-1
		count = 0

		for y in (y_coord - 1)..(y_coord + 1) do
			for x in (x_coord -1)..(x_coord + 1) do
				# cell can not be its own neighbour
				unless x == x_coord && y == y_coord || @board[[y,x]].nil?
					if @board[[y,x]].ticked? 
						count = count + 1 
					end
				end
			end
		end
		@board[[y_coord, x_coord]].process count
	end

	def clear_board
		# clear board
		sleep 0.8
		(BOARD_HEIGHT).times do
		# 20.times do
    	print "\r" + ("\e[A\e[K"*3) 
 		end
	end

	def print_board
		board = ""
		for i in 0..BOARD_HEIGHT do
			for j in 0..BOARD_WIDTH do
			 	if @board[[i,j]].ticked? 
			 		printf "☻" 
		 		else

		 			printf "○"
		 		end
			end
			printf "\n"
		end
	end
end