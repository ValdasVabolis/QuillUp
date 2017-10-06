class UsersController < ApplicationController
	before_action :set_user, only: [:questions, :answers]
	layout 'profile'

	def index
		redirect_to request.path << '/profile'
	end

	# /users/username
  def profile
    redirect_to users_profile_questions_path(params[:username])
  end

  # /users/:username/questions
  def questions
    @questions = @user.questions.paginate(page: params[:page]).order('created_at DESC')
  end

  # /users/:username/answers
  def answers
    @answers = @user.answers.paginate(page: params[:page]).order('created_at DESC')
  end

  private

  def set_user
    @user = User.find_by(username: params[:username])
  end
end
