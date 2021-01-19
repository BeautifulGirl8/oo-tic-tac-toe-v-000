class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]


def input_to_index(string)
  @choose = string.to_i - 1
end

def move(input_to_index, player)
@board |input_to_index| = player
end

#def valid_move?(board, index)
   #!position_taken?(board, index) && index.between?(0,  8)
 #end

 def position_taken?(input_to_index)
 if board[input_to_index] == "X" || board[input_to_index] == "O"
   true
 else
  false
 end
end

 def valid_move?(input_to_index)
    @board[input_to_index] && !position_taken?(input_to_index)
 end

 def turn_count(board)
 count = 0
 @board.each do |i|
    i == "X" || i == "O"
     count += 1

   end
   return count
 end


def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))

    display_board(board)
  else
    puts "invalid"
    turn(board)
  end
end

#def turn(board)
   #puts "Please enter 1-9:"
   #user_input = gets.strip
   #index = input_to_index(input)
   #if valid_move?(board, index)
      #move(board, index, character)
      #turn(board)
   #then
   #display_board(board)
#end
#end




def current_player(board)
 number = turn_count(board)
 if number % 2 == 0
  return "X"
else
  return "O"
 end
 end







# !(board[index].nil? || board[index] == " "
#win_index_1 = win_combination[0]
    #win_index_2 = win_combination[1]
    #win_index_3 = win_combination[2]

    #position_1 = board[win_index_1]
    #position_2 = board[win_index_2]
    #position_3 = board[win_index_3]





def won?(board)

 WIN_COMBINATIONS.detect do | win_combination |

location1 = win_combination[0]
location2 = win_combination[1]
location3 = win_combination[2]

board[location1] == board[location2] && board[location2] == board[location3] && board[location1] != " "
    end
end

def full?(board)
board.none? { | position | position == " " }
end

def draw?(board)
full?(board) && !won?(board)
end












def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  win_combination = won?(board)
  if win_combination != nil
    win_location = win_combination[0]
    board[win_location]

  end
end

def play(board)
  until over?(board)
     turn(board)
  end
  if won?(board)
     winner(board) == "X" || winner(board) == "O"
     puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
     puts "Cat's Game!"
  end
end

end
