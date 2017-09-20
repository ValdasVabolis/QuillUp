class HomeController < ApplicationController
  def index
    @questions = Question.includes(:user, :answers)
                         .paginate(page: params[:page])
                         .order('pin DESC, created_at DESC')
  end
end
