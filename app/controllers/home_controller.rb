class HomeController < ApplicationController
  def index
    @questions = Question
      .includes(:user, :answers)
      .paginate(page: params[:page])
      .order('created_at DESC')
  end
end