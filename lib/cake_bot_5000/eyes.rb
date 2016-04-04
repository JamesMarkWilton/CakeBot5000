class CakeBot5000
  class Eyes
    attr_reader :everything, :northwest, :north,  :northeast,
                             :west,      :center, :east,
                             :southwest, :south,  :southeast

    def initialize(grid)
      @everything = grid
      @northwest = grid[0]; @north  = grid[1]; @northeast = grid[2]
      @west      = grid[3]; @center = grid[4]; @east      = grid[5]
      @southwest = grid[6]; @south  = grid[7]; @southeast = grid[8]
    end

    def look_at_contents(loc)
      return loc["contents"][0] if !loc["contents"].empty?
    end

    def look_at_type(loc)
      return loc["contents"][0]["type"] if !loc["contents"].empty?
    end

    def get_coordinates(loc)
      [] << loc["x"] << loc["y"]
    end

    def look_for(thing)
      found_things = []

      everything.each_with_index do |location, index|
        if !location["contents"].empty? && location["contents"][0]["type"] == thing
          found_things << {"locs" => get_coordinates(location), "index" => index}
        end
      end
      found_things
    end

    def see_a_wall?(direction)
      location = send(direction.to_sym)
      return location["contents"][0]["type"] == "wall" if !location["contents"].empty?
    end
  end
end
