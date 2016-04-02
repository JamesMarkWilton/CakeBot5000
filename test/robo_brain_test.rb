require 'robo_brain'

class RoboBrain < MiniTest::Test
  def test_my_robot_moves_toward_cake
    robot = RobotBrain.new
    assert_equal "move_north", robot.action_finder([{"contents" => [{"type" => "cake"}]}])
  end
    # assert_eqaul "eat_cake", robot.action_finder([{"contents" => ["", "", "", "", {"type" => "cake"}]}])
end
