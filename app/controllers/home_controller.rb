class HomeController < ApplicationController
  def index
    @questions = Question.paginate(page: params[:page]).order('created_at DESC')
  end
end