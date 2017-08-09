class Users::Questions::AnswersController < ApplicationController
  before_action :set_users_questions_answer, only: [:show, :edit, :update, :destroy, :vote]

  def show
  end

  def reply
    @parent = Answer.find(params[:id])
    @answer = @parent.children.new
    @answer.question = @parent.question
  end

  def edit
    set_previous_path
  end

  def create
    @question = Question.find(params[:question_id])
    @answers = @question.answers.paginate(page: params[:page]).order('created_at DESC')
    #@parent = Answer.find(params[:parent_id])
    @answer = @question.answers.new(users_questions_answer_params)
    @answer.user = current_user
    #@answer.parent = @parent
    @answer.save
  end

  def vote
    type = params[:type]
    @answer.vote_by voter: current_user, vote: type
  end

  def update
    if @answer.update(users_questions_answer_params)
      flash[:notice] = "Answer updated succesfully!"
      redirect_to_previous_path
    else
      flash[:danger] = "Something went wrong. Please try again."
    end
  end

  def destroy
    @answer.soft_delete!
  end
 
  private
    def set_users_questions_answer
      @answer = Answer.find(params[:id])
    end

    def users_questions_answer_params
      params.require(:answer).permit(:body, :user_id)
    end
end
