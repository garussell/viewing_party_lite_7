class MovieCast
  attr_reader :id, :name, :character

  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:name]
    @character = attributes[:character]
  end
end