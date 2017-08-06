class Users::Posts::CommentsController < ApplicationController
  before_action :set_users_posts_comment, only: [:show, :edit, :update, :destroy, :vote]

  def index
    @comments = Comment.all
  end

  def show
  end

  def reply
    @parent = Comment.find(params[:id])
    @comment = @parent.children.new
    @comment.post = @parent.post
  end

  def edit
    set_previous_path
  end

  def create
    post = Post.find(params[:post_id])
    @parent = Comment.find(params[:parent_id])
    @comment = post.comments.new(users_posts_comment_params)
    @comment.user = current_user
    @comment.parent = @parent
    @comment.save
  end

  def vote
    type = params[:type]
    @comment.vote_by voter: current_user, vote: type
  end

  def update
    if @comment.update(users_posts_comment_params)
      flash[:notice] = "Comment updated succesfully!"
      redirect_to_previous_path
    else
      flash[:danger] = "Something went wrong. Please try again."
    end
  end

  def destroy
    @comment.soft_delete!
  end
 
  private
    def set_users_posts_comment
      @comment = Comment.find(params[:id])
    end

    def users_posts_comment_params
      params.require(:comment).permit(:body, :user_id)
    end
end
