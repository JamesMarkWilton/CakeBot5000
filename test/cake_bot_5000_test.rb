require 'cake_bot_5000'
require 'test_helpers/build_grid'

class CakeBot5000Test < MiniTest::Test
  def test_robot_moves_toward_cake_if_it_can_see_one
    grid      = TestHelpers::BuildGrid.new
    robot     = CakeBot5000.new
    center_at = [3, 4, false]

    assert_equal "move_north", robot.take_action(grid.with(center_at, {1 => "cake"}))
    assert_equal "move_south", robot.take_action(grid.with(center_at, {7 => "cake"}))
    assert_equal "move_east", robot.take_action(grid.with(center_at, {5 => "cake"}))
    assert_equal "move_west", robot.take_action(grid.with(center_at, {3 => "cake"}))
  end

  def test_robot_eats_cake_if_it_is_standing_on_one
    grid  = TestHelpers::BuildGrid.new
    robot = CakeBot5000.new

    refute_equal "eat_cake", robot.take_action(grid.with([3, 4, false], {1 => "cake"}))
    assert_equal "eat_cake", robot.take_action(grid.with([3, 3, true]))
  end

  def test_robot_moves_randomly_if_it_can_not_see_a_cake
    grid  = TestHelpers::BuildGrid.new
    robot = CakeBot5000.new

    5.times do
      direction = robot.take_action(grid.with([3, 4, false]))

      assert_match /move_(north|east|west|south)/, direction
      refute_equal "eat_cake", direction
    end
  end

  def test_robot_does_not_walk_into_a_wall
    grid  = TestHelpers::BuildGrid.new
    robot = CakeBot5000.new

    20.times do
      action = robot.take_action(grid.with([0, 0, false], {1 => "wall",
                                                           3 => "wall",
                                                           5 => "wall"}))
      assert_equal "move_south", action
    end
  end
end
