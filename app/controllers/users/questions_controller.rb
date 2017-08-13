class Users::QuestionsController < ApplicationController
  before_action :set_users_question, only: [:show, :edit, :update, :destroy]

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
    set_previous_path
  end

  def create
    @question = Question.new(users_question_params)
    @question.user = current_user
    @question.save
    redirect_to root_url
  end

  def update
    if @question.update(users_question_params)
      flash[:notice] = "Question updated succesfully!"
      redirect_to_previous_path
    else
      flash[:danger] = "Something went wrong. Please try again."
    end
  end

  def destroy
    @question.soft_delete!
  end

  def vote
    id = params[:id]
    type = params[:type]
    @question = Question.find(id)
    if current_user.send("voted_#{type}_on?", @question)
      @question.unvote_by current_user
    else
      @question.vote_by voter: current_user, vote: type
    end
  end

  private

    def set_users_question
      @question = Question.find(params[:id])
    end


    def users_question_params
      params.require(:question).permit(:title, :body, :user_id)
    end
end
