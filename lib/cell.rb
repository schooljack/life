
class Cell

	def initialize
		@ticked = (rand 8).zero?
	end

	def ticked?
		return @ticked
	end

	def process live_neighbours
		if !@ticked && live_neighbours == 3
			@ticked = true
		else
			if live_neighbours < 2 || live_neighbours > 3
				@ticked = false
			end
		end
	end

end