class Movie
  attr_reader :title, 
              :overview, 
              :vote_average, 
              :id

  def initialize(attributes)
    @id = attributes[:id]
    @title = attributes[:title]
    @overview = attributes[:overview]
    @vote_average = attributes[:vote_average]
  end
end