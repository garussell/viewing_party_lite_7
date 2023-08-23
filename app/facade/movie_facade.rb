class MovieFacade
  def initialize(title)
    @title = title
  end

  def top_movies
    movie = MovieService.new
    json = movie.discover_movies
    search_results = json[:results].map do |movie|
      DiscoverMovie.new(movie)
    end
  end

  def search_movies
    movie = MovieService.new
    json = movie.search_movies(@title)
    search_results = json[:results].map do |movie|
      DiscoverMovie.new(movie)
    end
  end
end