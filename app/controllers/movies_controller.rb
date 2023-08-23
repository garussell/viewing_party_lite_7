class MoviesController < ApplicationController
  def index
    @facade = MovieFacade.new(params[:title])
  end
end