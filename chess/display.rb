require 'colorize'
require_relative 'board'
require_relative 'cursor'

class Display
attr_reader :cursor, :board

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    system 'clear'
    @board.grid.each_with_index do |row, i|
      row.each_with_index do |piece, j|
        if piece.is_a?(Piece)
          symbol = "P"
        else
          symbol = " "
        end
        if [i, j] == @cursor.cursor_pos
          symbol = symbol.colorize(:background => :green)
        end
        print symbol
      end
      puts
    end
    nil
  end

end

# d = Display.new(Board.new)
# loop do
#   d.render
#   d.cursor.get_input
# end

b = Board.new
d = Display.new(b)
loop do
  start_pos = nil
  until start_pos
    d.render
    start_pos = d.cursor.get_input
  end

  end_pos = nil
  until end_pos
    d.render
    end_pos = d.cursor.get_input
  end

  d.board.move_piece(start_pos, end_pos)
end
