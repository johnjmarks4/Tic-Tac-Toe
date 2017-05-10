class Board
  
  def initialize
    @board = Array.new(3).map { |row| Array.new(3) }
    @winner = false
    @player_turn = rand(2)
    @player_turn = "X" if @player_turn == 0
    @player_turn = "O" if @player_turn == 1
  end

  def board
    @board
  end

  def print_board
    puts @board.inspect
    top_row = @board[0][0..2]
    middle_row = @board[1][0..2]
    bottom_row = @board[2][0..2]
    puts "\n" + top_row.join(" | ") + "\n"
    9.times { print "-" }
    puts "\n" + middle_row.join(" | ") + "\n"
    9.times { print "-"}
    puts "\n" + bottom_row.join(" | ") + "\n\n"
  end
  
  def make_mark(input)
    puts input.inspect
    row = input[0].to_i
    column = input[1].to_i
    if row > 3 || column > 3
      puts "You must select spaces between 0 and 3. Please select again."
      make_mark(gets.chomp.split(','))
    elsif @board[row][column].nil?
      @board[row][column] = @player_turn
    else
      puts "That space is already occupied. Please select again."
      make_mark(gets.chomp.split(','))
    end
  end
  
  def switch_turn
    @player_turn == "X" ? @player_turn = "O" : @player_turn = "X"
  end
  
  def winner
    @winner
  end
  
  def check_for_winner
    if @board[0][0] == @player_turn && @board[0][1] == @player_turn && @board[0][2] == @player_turn
      puts "#{@player_turn} wins"
      @winner = true
    elsif @board[1][0] == @player_turn && @board[1][1] == @player_turn && @board[1][2] == @player_turn
      puts "#{@player_turn} wins"
      @winner = true
    elsif @board[2][0] == @player_turn && @board[2][1] == @player_turn &&@board[2][2] == @player_turn
      puts "#{@player_turn} wins"
      @winner = true
    elsif @board[0][0] == @player_turn && @board[1][0] == @player_turn && @board[2][0] == @player_turn
      puts "#{@player_turn} wins"
      @winner = true
    elsif @board[0][1] == @player_turn && @board[1][1] == @player_turn && @board[2][1] == @player_turn
      puts "#{@player_turn} wins"
      @winner = true
    elsif @board[0][2] == @player_turn && @board[1][2] == @player_turn && @board[2][2] == @player_turn
      puts "#{@player_turn} wins"
      @winner = true
    elsif @board[0][0] == @player_turn && @board[1][1] == @player_turn && @board[2][2] == @player_turn
      puts "#{@player_turn} wins"
      @winner = true
    elsif @board[0][2] == @player_turn && @board[1][1] == @player_turn && @board[2][0] == @player_turn
      puts "#{@player_turn} wins"
      @winner = true
    end
  end
    
end

my_board = Board.new
turns = 0

while my_board.winner == false
  my_board.print_board
  puts "Where would you like to mark?"
    
  my_board.make_mark(gets.chomp.split(','))
  
  my_board.check_for_winner
  my_board.switch_turn

  turns += 1

  if turns == 9
    my_board.print_board
    puts "Draw!"
    break
  end
end