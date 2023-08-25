class DiscoverController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:search]
      @movies = MovieFacade.search_movies(params[:search])
    else
      @movies = MovieFacade.top_rated_movies
    end
  end
end