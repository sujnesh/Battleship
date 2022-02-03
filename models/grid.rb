class Grid
  attr_accessor :player, :grid, :grid_size, :battleship_size, :missile_size
  BATTLESHIP_ICON = 'B'
  HIT_ICON = 'X'
  MISHIT_ICON = 'O'

  def intialize(player, grid_size, battleship_size, missile_size)
    @grid_size = grid_size
    @battleship_size = battleship_size
    @missile_size = @missile_size
    @player = player
    @grid = create_grid(grid_size)
  end

  def create_empty_grid(grid_size)
    grid = []
    [0..grid_size].each do |row|
      row_varables = []
      [0..grid_size].each do |column|
        row_varables << '-'
      end
      grid << row_variables
    end

    return grid
  end

  def add_battleships(battleships)
    battleships.each do |battleship|
      x = battleship.x_coordinate
      y = battleship.y_coordinate

      @grid[x][y] = BATTLESHIP_ICON
    end
  end

  def mark_incoming_missiles(missiles)
    missiles.each do |missile|
      x = missile.x_coordinate
      y = missile.y_coordinate

      if grid[x][y] == BATTLESHIP_ICON
        mark_hit(x, y)
      else
        mark_mishit
      end
    end
  end

  def mark_mishit(x, y)
    @grid[x][y] = HIT_ICON
  end

  def mark_hit(x, y)
    @grid[x][y] = MISHIT_ICON
  end

end