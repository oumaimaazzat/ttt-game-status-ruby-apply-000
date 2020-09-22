puts board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']

def display_board(board)
   puts " #{board[0]} | #{board[1]} | #{board[2]} "
   puts "-----------"
   puts " #{board[3]} | #{board[4]} | #{board[5]} "
   puts "-----------"
   puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def position_taken?(board, index)
   if (board[index] == " ") || (board[index] == "") || (board[index] == nil)
      return false 
   else
      return true
   end
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

def won?(board)
  WIN_COMBINATIONS.each do |single_win_combo|
    win_index_1 = single_win_combo[0]
    win_index_2 = single_win_combo[1]
    win_index_3 = single_win_combo[2]
    
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
   
    if position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
      return single_win_combo
    end
  end
  return false
end

def full?(board)
   board.all? {|i| i == "X" || i == "O"}
end

def draw?(board)
    if !won?(board) && full?(board)
    return true
  elsif !won?(board) && !full?(board)
    return false
  else won?(board)
    return false
  end
end

def over?(board)
   if draw?(board) || won?(board) || full?(board)
     return true
   end
end
      

def winner(board)
   if won?(board)
      return board[won?(board)[0]]
   end
end

