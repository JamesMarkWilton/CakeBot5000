class CakeBot3000
  class Eyes
    attr_reader :around_me

    def initialize(grid)
      @around_me = grid
    end

    def look_around
      i_see = []

      around_me.each_with_index do |location, index|
        if !location["contents"].empty?
          i_see << {"type" => location["contents"][0]["type"], "index" => index}
        end
      end
      i_see
    end
  end
end
