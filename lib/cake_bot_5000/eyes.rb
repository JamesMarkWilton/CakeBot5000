class CakeBot5000
  class Eyes
    attr_reader :northwest, :north,  :northeast,
                :west,      :center, :east,
                :southwest, :south,  :southeast

    def initialize(grid)
      @northwest = grid[0], @north  = grid[1], @northeast = grid[2],
      @west      = grid[3], @center = grid[4], @east      = grid[5],
      @southwest = grid[6], @south  = grid[7], @southeast = grid[8]
    end

    def look_at_contents(loc)
      loc["contents"][0]
    end

    def look_at_type(loc)
      loc["contents"][0]["type"]
    end
  end
end
