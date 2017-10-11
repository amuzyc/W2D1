require_relative 'board'
require_relative 'cursor'
require_relative 'piece'

b = Board.new
d = Display.new(b)
loop do

  begin
    start_pos = nil
    until start_pos
      d.render
      start_pos = d.cursor.get_input
    end

    # p b[start_pos].moves
    # p b[start_pos].valid_moves
    # p b.in_check?(:white)
    # p b.in_check?(:black)

    end_pos = nil
    until end_pos
      d.render
      end_pos = d.cursor.get_input
    end

    d.board.move_piece(start_pos, end_pos)
  rescue => error
    puts error.message
    # sleep(3)
    retry
  end
end
