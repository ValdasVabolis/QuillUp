class Users::Questions::AnswersController < ApplicationController
  before_action :set_users_questions_answer, only: [:show, :edit, :update, :destroy, :vote]

  def show
  end

  def reply
    @answer = Answer.find(params[:id])
    @comment = @answer.comments.new
  end

  def edit
  end

  def create
    @question = Question.find(params[:question_id])
    @answers = @question.answers.paginate(page: params[:page]).order('created_at DESC')
    @answer = @question.answers.new(users_questions_answer_params)
    @answer.user = current_user
    if @answer.save
      puts 'Answer created succesfully!'
    else
      puts 'Something went wrong. Please try again.'
    end
  end

  def vote
    type = params[:type]
    if current_user.send("voted_#{type}_on?", @answer)
      @answer.unvote_by current_user
    else
      @answer.vote_by voter: current_user, vote: type
    end
  end

  def update
    if @answer.update(users_questions_answer_params)
      puts 'Answer updated succesfully!'
    else
      puts 'Something went wrong. Please try again.'
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
