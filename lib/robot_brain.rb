class RobotBrain
  attr_accessor :btdt

  def initialize
    @btdt = {"x" => [], "y" => []}
  end

  def action_finder(grid)
    where_am_i(grid)
    return "eat_cake" if here_be_cake?(grid)
    find_cake(grid)
  end

  def find_cake(grid)
    action = nil
    grid.each_with_index do |loc, index|
      if loc["contents"][0] && loc["contents"][0]["type"] == "cake"
        case index
        when 0, 1, 2
          action = "move_north"
        when 3
          action = "move_west"
        when 5
          action = "move_east"
        else
          action = "move_south"
        end
      else
        action = random
      end
    end
    action
  end

  def here_be_cake?(grid)
    grid[4]["contents"][0]["type"] == "cake"
  end

  def where_am_i(grid)
    btdt["x"] << grid[4]["x"]
    btdt["y"] << grid[4]["y"]
  end

  def random
    case rand(0..4)
    when 1
      "move_north"
    when 2
      "move_south"
    when 3
      "move_west"
    else
      "move_east"
    end
  end
end
