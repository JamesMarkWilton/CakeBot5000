class RobotBrain
  attr_accessor :btdt

  def initialize
    @btdt = {"x" => [], "y" => []}
  end

  def take_action(grid)
    where_am_i(grid)
    return "eat_cake" if here_be_cake?(grid)
    find_cake(grid)
  end

  def find_cake(grid)
    if cardinal_cake?(grid)
      cardinal_cake?(grid)
    else
      random
    end
  end

  def cardinal_cake?(grid)
    north = grid[1]
    south = grid[7]
    east = grid[5]
    west = grid[3]

    if north["contents"][0] && north["contents"][0]["type"] == "cake"
      "move_north"
    elsif south["contents"][0] && south["contents"][0]["type"] == "cake"
      "move_south"
    elsif east["contents"][0] && east["contents"][0]["type"] == "cake"
      "move_east"
    elsif west["contents"][0] && west["contents"][0]["type"] == "cake"
      "move_west"
    else
      false
    end
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
