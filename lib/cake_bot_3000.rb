require 'cake_bot_3000/eyes'

class CakeBot3000
  def tell_me_what_you_see(grid)
    eyes = Eyes.new(grid)
    stuff_i_see = eyes.look_around
    talk_to_me = []

    position = %w[NorthWest North NorthEast West Center East SouthWest South SouthEast]
    stuff_i_see.each do |stuff|
      talk_to_me << "#{stuff["type"].capitalize} to the #{position[stuff["index"]]}"
    end

    talk_to_me
  end
end
