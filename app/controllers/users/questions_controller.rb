class Users::QuestionsController < ApplicationController
  before_action :set_users_question, only: [:show, :edit, :update, :destroy, :vote]

  def index
    @questions = current_user.questions
  end

  def show
    @answers = @question.answers.paginate(page: params[:page]).order('created_at DESC')
    @answer = Answer.new if user_signed_in?
  end

  def new
    @question = current_user.questions.new
  end

  def edit
    
  end  

  def create
    @question = Question.new(create_users_question_params)
    @question.user = current_user
    if @question.save
      flash[:notice] = t(:question_created_succesfully)
      redirect_to root_url
    else
      flash[:danger] = 'Something went wrong. Please try again.'
      redirect_to root_url
    end
  end

  def update
    @question.update(update_users_question_params)
  end

  def destroy
    @question.soft_delete!
  end

  def vote
    type = params[:type]
    unless current_user.nil?
      if current_user.send("voted_#{type}_on?", @question)
        @question.unvote_by current_user
      else
        @question.vote_by voter: current_user, vote: type
      end
    end
  end

  private

  def set_users_question
    @question = Question.find(params[:id])
  end

  def create_users_question_params
    params.require(:question).permit(:title, :body, :user_id)
  end

  def update_users_question_params
    params.require(:question).permit(:body, :user_id)
  end
end
