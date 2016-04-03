require 'cake_bot_5000'
require 'grid_builder'

class RoboBrain < MiniTest::Test

  def test_my_robot_moves_toward_cake_if_in_a_cardinal_direction
    robot = CakeBot5000.new
    grid = CakeBot5000::GridBuilder.new
    center = [3, 4, false]

    assert_equal "move_north", robot.take_action(grid.set_grid(center, {1 => "cake"}))
    assert_equal "move_south", robot.take_action(grid.set_grid(center, {7 => "cake"}))
    assert_equal "move_east", robot.take_action(grid.set_grid(center, {5 => "cake"}))
    assert_equal "move_west", robot.take_action(grid.set_grid(center, {3 => "cake"}))
  end

  def test_my_robot_knows_where_it_has_been
    robot = CakeBot5000.new
    grid = CakeBot5000::GridBuilder.new

    robot.take_action(grid.set_grid([0, 0, false], {1 => "cake"}))
    robot.take_action(grid.set_grid([0, -1, true]))
    assert_equal [0, 0], robot.btdt["x"]
    assert_equal [0, -1], robot.btdt["y"]
  end

  def test_robot_eats_if_on_cake
    robot = CakeBot5000.new
    grid = CakeBot5000::GridBuilder.new

    refute_equal "eat_cake", robot.take_action(grid.set_grid([3, 4, false], {1 => "cake"}))
    assert_equal "eat_cake", robot.take_action(grid.set_grid([3, 3, true]))
  end

  def test_robot_moves_randomly
    robot = CakeBot5000.new
    grid = CakeBot5000::GridBuilder.new

    5.times do
      direction = robot.take_action(grid.set_grid([3, 4, false]))

      assert_match /move_(north|east|west|south)/, direction
      refute_equal "eat_cake", direction
    end
  end
end
