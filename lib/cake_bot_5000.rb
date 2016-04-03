require 'robot_eyes'

class CakeBot5000
  attr_accessor :visited

  def initialize
    @visited = []
    @walls = []
  end

  def take_action(grid)
    eyes = Eyes.new(grid)
    remember_location(eyes)
    return "eat_cake" if here_be_cake?(eyes)
    find_cake(eyes)
  end

  def find_cake(eyes)
    if cardinal_cake?(eyes)
      cardinal_cake?(eyes)
    else
      random
    end
  end

  def cardinal_cake?(eyes)
    if eyes.look_at_contents(eyes.north) && eyes.look_at_type(eyes.north) == "cake"
      "move_north"
    elsif eyes.look_at_contents(eyes.south) && eyes.look_at_type(eyes.south) == "cake"
      "move_south"
    elsif eyes.look_at_contents(eyes.east) && eyes.look_at_type(eyes.east) == "cake"
      "move_east"
    elsif eyes.look_at_contents(eyes.west) && eyes.look_at_type(eyes.west) == "cake"
      "move_west"
    else
      false
    end
  end

  def here_be_cake?(eyes)
    eyes.look_at_type(eyes.center) == "cake"
  end

  def remember_location(eyes)
    loc = [] << eyes.center["x"] << eyes.center["y"]
    visited << loc
  end

  def random
    %w[move_north move_south move_west move_east].sample
  end
end
