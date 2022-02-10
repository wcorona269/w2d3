class Board

    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N) }
        @size = (n * n)
    end

    attr_reader :size

    def [](position)
        row = position[0]
        col = position[1]
        @grid[row][col]
    end

    def []=(position, value)
        row = position[0]
        col = position[1]
        @grid[row][col] = value
    end

    def num_ships
        @grid.flatten.count { |ele| ele == :S } # can't use @grid.count and #include? in brackets because there could be more than one :S in each row/col
    end

    def attack(position)
        if self[position] == :S
            self[position] = :H
            puts "you sunk my battleship!"
            return true
        else
            self[position] = :X
            return false 
        end
    end

    def place_random_ships
        ship_count = @size * 0.25

        while self.num_ships < ship_count
            row = rand(0...@grid.length)
            col = rand(0...@grid.length)
            position = [ row, col ]
            self[position] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |ele|
                if ele == :S
                    :N
                else
                    ele
                end
            end
        end
    end

    def self.print_grid(new_grid)
        new_grid.each do |row|
            puts row.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end

    


end




