module Checkers
  def check_horizontals(arr) #output o x or false
    case
    when arr.any? { |row| row.all? {|val| val == 'o'}}
      return 'o'
    when arr.any? { |row| row.all? {|val| val == 'x'}}
      return 'x'
    end
    return false
  end

  def check_verticals(arr)
    check_horizontals(arr.transpose)
  end

  def check_diagonals(arr)
    main_diagonal = arr.map.with_index { |row, i| row[i] }
    secondary_diagonal = arr.reverse.map.with_index { |row, i| row[i] }
    check_horizontals([main_diagonal,secondary_diagonal])
  end

  def check_winner(arr)
    if check_diagonals(arr)
      return check_diagonals(arr)
    elsif check_horizontals(arr)
      return check_horizontals(arr)
    elsif check_verticals(arr)
      return check_verticals(arr)
    end
    return false
  end
end

module TicTacToe
  class Mark
    @@mark_number = 0

    attr_accessor :row, :type, :col

    def self.mark_number
      @@mark_number
    end

    def self.mark_number=(setted)
      @@mark_number = setted
    end

    def initialize(type, position) # o or x ,[0,0]
      @type = type
      @row, @col = position
      @@mark_number +=1
    end
  end

  class Board
  include Checkers
    attr_accessor :board
    def initialize
      @board = Array.new(3) { Array.new(3) }
      @winner = false
    end

    def add_mark(mark)
      @board[mark.row][mark.col] = mark.type
    end

    def show_board
      @board.each { |arr| p arr }
    end

    def won?
      check_winner(@board)
    end
  end
end

def play_tic_tac_toe
  board = TicTacToe::Board.new
  TicTacToe::Mark.mark_number = 0
  turn = 'x'
  until board.won?
      puts "#{turn}'s turn, type location in row col format: "
    loc = gets.chomp
    loc = loc.split
    loc.map!(&:to_i)
    board.add_mark(TicTacToe::Mark.new(turn,loc))
    turn = turn=='x' ? 'o' : 'x'

    board.show_board
    if TicTacToe::Mark.mark_number >=9
      return 'Tie!'
    end
  end
  puts "Winner is #{board.won?}"
end
