class ViewingPartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @viewing_party = @user.viewing_parties.new
    facade = MovieFacade.new(params[:id])
    @movie = facade.get_movie_by_id(params[:id]) 
  end

  def create
    user_id = params[:user_id]
    movie_title = params[:movie_title]
    user_ids = params[:viewing_party][:user_ids]
    invited_users = User.where(id: user_ids) 
      
    viewing_party_params = {
      host: user_id,
      movie: movie_title,
      duration: params[:viewing_party][:duration_minutes],
      viewing_time: params[:viewing_party][:start_time],
      viewing_date: params[:viewing_party][:date],
      users: invited_users
    }
      
    viewing_party = ViewingParty.create!(viewing_party_params)
      
    UsersViewingParty.create!(user_id: user_id, viewing_party_id: viewing_party.id)
    invited_users.each do |user|
      UsersViewingParty.create!(user_id: user.id, viewing_party_id: viewing_party.id)
    end

    redirect_to user_path(user_id)
  end
end 