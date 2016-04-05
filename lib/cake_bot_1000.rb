class CakeBot1000
  attr_reader :name, :server

  def initialize(info)
    @name = info[:name]
    @server = info[:server]
  end
end
