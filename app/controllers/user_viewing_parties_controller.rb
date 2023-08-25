class UserViewingPartiesController < ApplicationController

  def create
    user = User.find(params[:user_id])
    @viewing_party = ViewingParty.find(params[:viewing_party_id])
      user_viewing_party = UserViewingParty.new(user_id: user.id, viewing_party_id: @viewing_party.id)
      user_viewing_party.save
      params[:user_ids].each do |user_id|
        user_viewing_party = UserViewingParty.new(user_id: user_id, viewing_party_id: @viewing_party.id)
        user_viewing_party.save
      end
      redirect_to user_path(user)
  end
end