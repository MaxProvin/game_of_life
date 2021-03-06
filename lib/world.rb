class World

  attr_reader :row_num, :col_num, :grid

  def initialize(cell = Cell.new)
    @grid = Array.new(3) do
    					Array.new(3) do
    					  cell
    					end
    				end
  end

  def seed(arr)
 		arr.each do |coord|
 			x, y = coord[0], coord[1]
 			grid[y][x].set_status('alive')
 		end
  end

  def cell_neighbours(cell_location)
  	neighbours = 0
  	neighbours += num_of_live_cells_north_south_east_or_west(cell_location)
  	neighbours += num_of_live_cells_on_diagonals(cell_location)
  end

  private

  def num_of_live_cells_north_south_east_or_west(cl)
		grid[cl[1] + 1][cl[0]].alive? ? north = 1 : north = 0
  	grid[cl[1] - 1][cl[0]].alive? ? south = 1 : south = 0
		grid[cl[1]][cl[0] + 1].alive? ? east = 1 : east = 0
  	grid[cl[1]][cl[0] - 1].alive? ? west = 1 : west = 0
  	north + south + east + west
  end

  def num_of_live_cells_on_diagonals(cl)
  	grid[cl[1] + 1][cl[0] + 1].alive? ? n_east = 1 : n_east = 0
  	grid[cl[1] - 1][cl[0] - 1].alive? ? s_west = 1 : s_west = 0
  	grid[cl[1] - 1][cl[0] + 1].alive? ? n_west = 1 : n_west = 0
  	grid[cl[1] + 1][cl[0] - 1].alive? ? s_east = 1 : s_east = 0
  	n_east + n_west + s_east + s_west
  end

end