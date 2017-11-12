class HomeController < ApplicationController
  def index
    @questions = Question.includes(:user)
                         .paginate(page: params[:page])
                         .order('pin DESC, created_at DESC')
  end

  def cv

  end
end
