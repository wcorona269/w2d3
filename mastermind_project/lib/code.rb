class Code
  
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }


  attr_reader :pegs

  def self.valid_pegs?(chars)
    chars.all? { |char| POSSIBLE_PEGS.has_key?(char.upcase) }
  end


  def initialize(pegs)
    if Code.valid_pegs?(pegs)
      @pegs = pegs.map {|peg| peg.upcase }
    else
      raise "invalid characters"
    end
  end

  def self.random(length)
    Code.new = Array.new(length, POSSIBLE_PEGS.sample)
  end

end

