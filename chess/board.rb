require_relative 'piece'

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    @grid[0] = Array.new(8) { Piece.new }
    @grid[1] = Array.new(8) { Piece.new }
    @grid[6] = Array.new(8) { Piece.new }
    @grid[7] = Array.new(8) { Piece.new }
    @grid[0][0] = Rook.new(self, [0, 0], :white)

  end

  def move_piece(start_pos, end_pos)
    x, y = start_pos
    m, n = end_pos
    raise "No Piece at starting position" if @grid[x][y].nil?
    @grid[m][n] = @grid[x][y]
    @grid[x][y] = nil
  end

  def make_starting_grid
  end

  def in_bound(pos)
    x, y = pos
    if x < 8 && x >= 0 && y < 8 && y >= 0
      true
    else
      false
    end

  end

end
