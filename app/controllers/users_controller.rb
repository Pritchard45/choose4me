class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    @email = @user.email
    @favorite = @user.favorites
  end

  def user_profile
    redirect_to current_user
  end
end
