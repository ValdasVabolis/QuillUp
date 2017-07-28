class UsersController < ApplicationController

  def show
    @user_show = User.find_by(username: params[:username])
  end

end
