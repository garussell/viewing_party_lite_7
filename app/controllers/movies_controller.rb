class MoviesController < ApplicationController
  def index
    @facade = MovieFacade.new(params[:title])
    @user = User.find(params[:user_id])
  end
end