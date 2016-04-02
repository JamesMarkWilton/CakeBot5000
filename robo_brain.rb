[{"x"=>2, "y"=>17, "contents"=>[]},
{"x"=>3, "y"=>17, "contents"=>[{"type"=>"wall"}]},
{"x"=>4, "y"=>17, "contents"=>[]},
{"x"=>2, "y"=>18, "contents"=>[]},
{"x"=>3, "y"=>18, "contents"=>[{"type"=>"robot", "name"=>"team2"}]},
{"x"=>4, "y"=>18, "contents"=>[]},
{"x"=>2, "y"=>19, "contents"=>[{"type"=>"wall"}]},
{"x"=>3, "y"=>19, "contents"=>[{"type"=>"wall"}]},
{"x"=>4, "y"=>19, "contents"=>[{"type"=>"wall"}]}}
require 'rest-client'
require 'json'

response = RestClient::Request.new(
  method: :get,
  url: '10.10.10.61:3000/cake_eater/robots/J&M',
  user: 'J&M',
  password: '9iMcQs3CKO',
).execute
puts response
action = nil
grid = JSON.parse(response)["grid"]

if grid[4]["contents"].length > 1 && grid[4]["contents"][0]["type"] == "cake"
  action = "eat_cake"
elsif grid[1]["contents"].length > 1 && grid[1]["contents"][0]["type"] == "cake"
  action = "move_north"
elsif grid[3]["contents"].length > 1 && grid[3]["contents"][0]["type"] == "cake"
  action = "move_west"
elsif grid[5]["contents"].length > 1 && grid[5]["contents"][0]["type"] == "cake"
  action = "move_east"
elsif grid[7]["contents"].length > 1 && grid[7]["contents"][0]["type"] == "cake"
  action = "move_south"
else
  dir = %w["move_south" "move_west" "move_east" move_north"]
  action = "#{dir[rand(0..3)]}"
end

puts RestClient::Request.new(
  method: :put,
  url: '10.10.10.61:3000/cake_eater/robots/J&M',
  user: 'J&M',
  password: '9iMcQs3CKO',
  payload: {"action":"#{action}"}
).execute


# response1 = JSON.parse(response1)
# response2 = JSON.parse(response2)
# require "pry"
# binding.pry

# loop do
  # JSON.parse(response).each do |location|
  # result = RestClient::Request.new(
    # method: :put,
    # url: '10.10.10.61:3000/cake_eater/robots/team1',
    # user: 'team2',
    # password: 'secrets',
    # payload: {"action" => "move_west"}.to_json
  # ).execute
# end
# end
# puts
