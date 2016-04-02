class RobotBrain
  attr_accessor :btdt

  def initialize
    @btdt = {"x" => [], "y" => []}
  end

  def action_finder(grid)
    action = nil
    eat = nil

    where_am_i(grid)

    grid.each_with_index do |loc, index|
      if loc["contents"][0] && loc["contents"][0]["type"] == "cake"
        case index
        when 0
          action = "move_north"
        when 1
          action = "move_north"
        when 2
          action = "move_north"
        when 3
          action = "move_west"
        when 4
          eat = "eat_cake"
        when 5
          action = "move_east"
        when 6
          action = "move_south"
        when 7
          action = "move_south"
        when 8
          action = "move_south"
        else
          action = "random"
        end
      end
    end
    return eat if eat
    action
  end

  def where_am_i(grid)
    btdt["x"] << grid[4]["x"]
    btdt["y"] << grid[4]["y"]
  end
end
