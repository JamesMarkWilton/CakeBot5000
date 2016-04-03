class GridBuilder
  attr_accessor :grid

  def set_grid(center, around_me={})
    grid = []
    9.times do
      grid <<  {"x" => nil, "y" => nil, "contents" => []}
    end
    @grid = grid

    center_info(center[0], center[1], center[2])
    put_stuff_on_grid(around_me)
    set_x
    set_y
    grid
  end

  def center_info(x, y, cake)
    grid[4]["x"]= x
    grid[4]["y"]= y

    if cake
      grid[4]["contents"] << {"type" => "cake"}
    else
      grid[4]["contents"] << {"type" => "robot"}
    end
  end

  def put_stuff_on_grid(map_items)
    index = 0
    items = {"cake" => {"type" => "cake"},
             "wall" => {"type" => "wall"}
    }

    until index == 9
      if map_items.has_key? index
        grid[index]["contents"] << items["#{map_items[index]}"]
      end

      if grid[index]["contents"].empty?
        grid[index]["contents"] << {}
      end
      index += 1
    end
  end

  def set_x
    grid.each_with_index do |loc, index|
      unless index == 4
        case index
        when 0, 3, 6
          loc["x"]= grid[4]["x"] - 1
        when 2, 5, 8
          loc["x"]= grid[4]["x"] + 1
        else
          loc["x"]= 0
        end
      end
    end
  end

  def set_y
    grid.each_with_index do |loc, index|
      unless index == 4
        case index
        when 0, 1, 2
          loc["y"]= grid[4]["y"] - 1
        when 6, 7, 8
          loc["y"]= grid[4]["y"] + 1
        else
          loc["y"]= 0
        end
      end
    end
  end
end
