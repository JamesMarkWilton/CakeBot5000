require 'robot_brain'

class RoboBrain < MiniTest::Test

  def grid_builder(locs, contents)
    grid = []

    locs.times do
      grid <<  {"x" => nil, "y" => nil, "contents" => []}
    end
    locs -= 1

    until locs == -1
      grid[locs]["x"]= locs
      grid[locs]["y"]= locs
      grid[locs]["contents"]= contents[locs]
      locs -= 1
    end
    grid
  end

  def test_my_robot_moves_toward_cake
    robot = RobotBrain.new
    assert_equal "move_north", robot.action_finder(grid_builder(3, [{}, {}, {"type" => "cake"}]))
  end

  def test_my_robot_knows_where_he_has_been
    robot = RobotBrain.new
    2.times do
      robot.action_finder(grid_builder(5, [{}, {}, {}, {}, {"type" => "robot"}]))
    end
    places_bot_went = robot.btdt
    assert_equal [4, 4], places_bot_went["x"]

    robot = RobotBrain.new
    4.times do
      robot.action_finder(grid_builder(5, [{}, {}, {}, {}, {"type" => "robot"}]))
    end
    places_bot_went = robot.btdt
    assert_equal [4, 4, 4, 4], places_bot_went["y"]
  end

  def test_robot_eats_closest_cake
    robot = RobotBrain.new

    assert_equal "move_north", robot.action_finder(grid_builder(5, [{"type" => "cake"}, {}, {}, {}, {"type" => "cake"}]))
    assert_eqaul "eat_cake",   robot.action_finder(grid_builder(5, [{}, {}, {}, {}, {"type" => "cake"}]))
  end
end
