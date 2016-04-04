require 'cake_bot_3000'
require 'test_helpers/build_grid'

class CakeBot3000Test < MiniTest::Test
  def test_robot_tells_me_what_it_sees
    grid      = TestHelpers::BuildGrid.new
    robot     = CakeBot3000.new
    center_at = [3, 4, false]

    around_robot = robot.tell_me_what_you_see(grid.with([0, 0, false], {5 => "wall"}))
    assert_equal ["Robot to the Center", "Wall to the East"], around_robot

    around_robot = robot.tell_me_what_you_see(grid.with([0, 0, false], {0 => "cake"}))
    assert_equal ["Cake to the NorthWest", "Robot to the Center"], around_robot
  end
end
