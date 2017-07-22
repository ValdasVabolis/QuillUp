class AccountsController < ApplicationController
  def index

  end

  def show
    @user_show = User.find_by(username: params[:username])
  end
end
