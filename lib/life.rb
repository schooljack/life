#!/usr/bin/env ruby

require_relative  "cell.rb"
require_relative "board.rb"
counter = 0
a = Board.new
while true
	a.clear_board
	a.print_board
	a.evolve
	printf "Generation: #{counter +=1} \n CTRL C to exit"
end
