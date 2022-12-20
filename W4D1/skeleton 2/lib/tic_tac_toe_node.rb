require_relative 'tic_tac_toe'

class TicTacToeNode
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end
  attr_accessor :board, :next_mover_mark, :prev_move_pos

  def losing_node?(evaluator)
    return false if board.full? && (@board.winner = nil? || @board.winner == evaluator) #winner? us?
    return true if board.full? && @board.winner != evaluator
    if evaluator  is us
      all child is losing then we lose
    else
      one child is losing
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # # the current move.
  def children
    # duped = @board.dup
    children = []
    (0..2).each do |row|
      (0..2).each do |col|
        pos = [row, col]
        duped = @board.dup
        if duped.empty?(pos)
          duped[pos] = self.next_mover_mark
          self.next_mover_mark == :x ? next_mover_mark = :o : next_mover_mark = :x
          child = TicTacToeNode.new(duped, next_mover_mark, pos)
          children << child
        end
      end
    end
    children
  end
end
