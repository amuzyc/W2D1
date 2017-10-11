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
          symbol = piece.symbol + ' '
        else
          symbol = "  "
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
