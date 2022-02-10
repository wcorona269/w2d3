require_relative "board"
require_relative "player"

class Battleship

    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size / 2
    end

    attr_reader :board, :player


    def start_game
        @board.place_random_ships
        puts @board.num_ships
        puts @board.print
    end

    def lose?
        if @remaining_misses <= 0
            puts "you lose"
            return true
        else
            return false
        end
    end

    def win?
        if @board.num_ships > 0
            return false
        else
            puts "you win"
            return true
        end
    end

    def game_over?
        if self.lose? || self.win?
            return true
        else
            return false
        end
    end

    def turn
        position = self.get_move
        self.attack(get_move)
    end
end
