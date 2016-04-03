require 'rest-client'
require 'json'
require 'cake_bot_5000'

robot = CakeBot5000.new

loop do
  response = RestClient::Request.new(
    method: :get,
    url: '10.10.10.61:3000/cake_eater/robots/J&M',
    user: 'J&M',
    password: '9iMcQs3CKO',
  ).execute

  grid = JSON.parse(response)["grid"]
  action = robot.action_finder(grid)

  RestClient::Request.new(
    method: :put,
    url: '10.10.10.61:3000/cake_eater/robots/J&M',
    user: 'J&M',
    password: '9iMcQs3CKO',
    payload: {"action":"#{action}"}
  ).execute
end
