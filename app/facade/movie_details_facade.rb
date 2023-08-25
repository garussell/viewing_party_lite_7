class MovieDetailsFacade
  def self.movie_details(movie)
    service = MovieService.new
    raw_movie_details = service.movie_details(movie)
    MovieDetails.new(title: raw_movie_details[:title], 
                    overview: raw_movie_details[:overview], 
                    runtime: raw_movie_details[:runtime], 
                    poster_path: raw_movie_details[:poster_path], 
                    genres: raw_movie_details[:genres], 
                    vote_average: raw_movie_details[:vote_average], 
                    id: raw_movie_details[:id])
  end

  def self.movie_cast(movie)
    service = TmdbService.new
    raw_cast = service.movie_cast(movie)[:cast]
    raw_cast.map do |cast_member|
      MovieCast.new(name: cast_member[:name],
                    character: cast_member[:character],
                    id: cast_member[:id])
    end
  end

  def self.movie_reviews(movie)
    service = TmdbService.new
    raw_reviews = service.movie_reviews(movie)[:results]
    raw_reviews.map do |raw_review|
      MovieReview.new(author: raw_review[:author],
                      content: raw_review[:content],
                      id: raw_review[:id])
    end
  end
end