class TicTacToe
    WIN_COMBINATIONS =[[0, 1, 2], [0, 4, 8], [3, 4, 5], [6, 7, 8], [1, 4, 7], [2, 5, 8], [0, 3, 6], [2, 4, 6]]

    def initialize
        @board = []
        9.times {@board << " "}
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        input = input.to_i
        input = input -= 1
    end

    def move(index, token = x)
        @board[index] = token
    end

    def position_taken?(position)
        @board[position] != " " ? true : false
    end

    def valid_move?(move)
        move < 9 && move > -1 ? (@board[move] != " " ? false : true) : false
    end

    def turn_count
        used_index = []
        @board.each_with_index {|space, index| used_index << index  if space != " "}
        used_index.count
    end

    def current_player
        if turn_count.even?
            "X"
        elsif turn_count.odd?
            "O"
        end
    end

    def turn
        puts "Enter a position (1-9)"
        position = gets.chomp
        position = input_to_index(position)
        valid_move?(position) ? move(position, current_player) : turn
        display_board
    end

    def won?
        WIN_COMBINATIONS.find do |win|
            first = win[0]
            second = win[1]
            third = win[2]

            player_1 = @board[first]
            player_2 = @board[second]
            player_3 = @board[third]

            player_1 != " " && player_1 == player_2 && player_2 == player_3
        end
    end

    def full?
        if @board.include? " "
            return false
        else
            return true
        end
    end

    def draw?
        if won?
            false
        elsif full? == false
            false
        else
            true
        end
    end

    def over?
        if draw?
            true
        elsif won?
            true
        else
            false
        end
    end

    def winner
        x = won?
        won? ? @board[x[1]] : nil
    end

    def play
        until over?
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end

end