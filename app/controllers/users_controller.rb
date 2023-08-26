class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @invited_to_viewing_parties = @user.invited_viewing_parties
    @created_viewing_parties = @user.viewing_parties
  end
end