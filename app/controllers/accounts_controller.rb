class AccountsController < ApplicationController
  before_action :authenticate_user!
  layout 'account'
  
  def profile
  	
  end

  def questions
    @questions = current_user.questions.paginate(page: params[:page]).order('created_at DESC')
  end

  def answers
    @answers = current_user.answers.paginate(page: params[:page]).order('created_at DESC')
  end
end
