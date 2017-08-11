class AccountsController < ApplicationController
  before_action :authenticate_user!
  
  def index
  	@questions = current_user.questions.paginate(page: params[:page]).order('created_at DESC')
  	@answers = current_user.answers.paginate(page: params[:page]).order('created_at DESC')
  end
end
