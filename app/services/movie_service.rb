class MovieService
  def top_rated_movies
    get_url("/3/movie/top_rated?api_key=#{ENV['API_KEY_AUTH']}&page=1")
  end

  def search_movies(query)
    get_url("/3/search/movie?api_key=#{ENV['API_KEY_AUTH']}&query=#{query}&page=1")
  end

  def movie_details(movie)
    get_url("/3/movie/#{movie}?api_key=#{ENV['API_KEY_AUTH']}")
  end

  def movie_cast(movie)
    get_url("/3/movie/#{movie}/credits?api_key=#{ENV['API_KEY_AUTH']}")
  end

  def movie_reviews(movie)
    get_url("/3/movie/#{movie}/reviews?api_key=#{ENV['API_KEY_AUTH']}")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://api.themoviedb.org')
  end
end