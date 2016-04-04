require 'cake_bot_5000'
require 'test_helpers/build_grid'
require 'test_helpers/fake_server'

class AcceptanceTest < MiniTest::Test
  def test_my_client_makes_requets_to_an_api
    server = TestHelpers::FakeServer.new
    robot = CakeBot5000.new name: 'wil', server: server

    server.get_to '/cake_eater', { "status" => "in_progress",
                                   "cake_remaining" => 13,
                                   "leaderboard" => [{"name" => "wil", "score" => 3 },
                                                     {"name" => "team2", "score" => 0 }
                                                    ]
                                }

    assert_equal "in_progress", robot.status
    assert_equal 14, robot.score
    assert_equal ["wil has 2 points", "team2 has 0 points"], robot.leaderboard
    server.get_to '/cake_eater/robots/wil'
    server.put_to '/cake_eater/robots/wil'
  end
end
