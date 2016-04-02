class RobotBrain
  def action_finder(grid)
    action = nil

    grid.each_with_index do |loc, index|

      if loc["contents"].length == 1 && loc["contents"][0]["type"] == "cake"
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
          action = "eat_cake"
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
    action
  end
end
