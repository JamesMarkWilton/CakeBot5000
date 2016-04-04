require 'cake_bot_5000/eyes'

class CakeBot5000
  # attr_reader :name, :server

  # def initialize(info)
    # @name = info[:name]
    # @server = info[:server]
  # end

  def take_action(grid)
    eyes = Eyes.new(grid)
    return "eat_cake" if here_be_cake?(eyes)
    move(eyes)
  end

  def move(eyes)
    if cake_nearby?(eyes)
      move_toward_closet_cake(eyes)
    else
      move_randomly(eyes)
    end
  end

  def cake_nearby?(eyes)
    !eyes.look_for("cake").empty?
  end

  def move_toward_closet_cake(eyes)
    cakes_around_me = eyes.look_for("cake")

    case cakes_around_me[0]["index"]
    when 0
      "move_north" unless eyes.see_a_wall?("north")
      "move_west"
    when 1
      "move_north"
    when 2
      "move_north" unless eyes.see_a_wall?("north")
      "move_east"
    when 3
      "move_west"
    when 5
      "move_east"
    when 6
      "move_north" unless eyes.see_a_wall?("north")
      "move_east"
    when 8
      "move_north" unless eyes.see_a_wall?("north")
      "move_east"
    else
      "move_south"
    end
  end

  def here_be_cake?(eyes)
    eyes.look_at_type(eyes.center) == "cake"
  end

  def move_randomly(eyes)
    direction = %w[north south west east].sample
    return "move_" + direction unless eyes.see_a_wall?(direction)
    move_randomly(eyes)
  end
end
