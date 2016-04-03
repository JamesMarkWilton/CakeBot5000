require 'rest-client'
require 'json'
$LOAD_PATH.unshift(File.expand_path("../../lib/", __FILE__))
require 'cake_bot_5000'

robot = CakeBot5000.new

loop do
  response = RestClient::Request.new(
    method: :get,
    url: "#{ARGV[0]}:#{ARGV[1]}/cake_eater/robots/#{ARGV[2]}",
    user: "#{ARGV[2]}",
    password: "#{ARGV[3]}",
  ).execute

  grid = JSON.parse(response)["grid"]
  action = robot.action_finder(grid)

  RestClient::Request.new(
    method: :put,
    url: "#{ARGV[0]}:#{ARGV[1]}/cake_eater/robots/#{ARGV[2]}",
    user: "#{ARGV[2]}",
    password: "#{ARGV[3]}",
    payload: {"action":"#{action}"}
  ).execute
end
