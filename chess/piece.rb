class Piece

end

module Stepable

end

module Slideable

  def moves
    result = []
    @move_dirs.each do |dir|
      i = 1
      loop do
        final_pos = grow_unblocked_moves_in_dir(dir[0] * i, dir[1] * i)
        break unless @board.in_bound(final_pos)
        result << final_pos
        i += 1
      end
    end
    result
  end

  private

  def grow_unblocked_moves_in_dir(dx, dy)
    x, y = @position
    [x + dx, y + dy]
  end
end

class Rook < Piece
  include Slideable

  def initialize(board, position, team)
    @board = board
    @position = position
    @team = team
    @move_dirs = [[0, 1], [1, 0], [0, -1], [-1, 0]]
    @symbol = :R
  end
end
