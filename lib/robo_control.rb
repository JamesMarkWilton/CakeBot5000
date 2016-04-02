require 'rest-client'
require 'json'

response = RestClient::Request.new(
  method: :get,
  url: '10.10.10.61:3000/cake_eater/robots/J&M',
  user: 'J&M',
  password: '9iMcQs3CKO',
).execute

grid = JSON.parse(response)["grid"]

RestClient::Request.new(
  method: :put,
  url: '10.10.10.61:3000/cake_eater/robots/J&M',
  user: 'J&M',
  password: '9iMcQs3CKO',
  payload: {"action":"#{action}"}
).execute
