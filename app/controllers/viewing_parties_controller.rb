class ViewingPartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @viewing_party = @user.viewing_parties.new
    facade = MovieFacade.new(params[:id])
    @movie = facade.get_movie_by_id(params[:id]) 
  end

  def create
    @user = User.find(params[:user_id])
    movie_runtime = params[:runtime].to_i
    facade = MovieFacade.new(params[:id])
    @movie = facade.get_movie_by_id(params[:id]) 

    viewing_party_params = {
      host: @user.name,
      movie: @movie.title,
      duration: params[:viewing_party][:duration_minutes],
      viewing_time: params[:viewing_party][:start_time],
      viewing_date: params[:viewing_party][:date],
      users: params[:viewing_party][:user_ids]
  }
  
    if params[:viewing_party][:duration_minutes].to_i >= movie_runtime
      
      @viewing_party = @user.viewing_parties.build(viewing_party_params)
      @viewing_party.users << User.find(params[:viewing_party][:user_ids])

      if @viewing_party.save
        redirect_to user_path(@user, id: params[:id])
      else
        flash[:error] = "Failed to create a new viewing party."
        redirect_back(fallback_location: root_path)
      end
    else
      flash[:error] = "Duration cannot be less than runtime - #{movie_runtime} minutes"
      redirect_back(fallback_location: root_path)
    end
  end
  
end 