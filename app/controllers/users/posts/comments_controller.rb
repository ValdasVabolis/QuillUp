class Users::Posts::CommentsController < ApplicationController
  before_action :set_users_posts_comment, only: [:show, :edit, :update, :destroy, :vote]

  def index
    @comments = Comment.all
  end

  def show
  end

  def edit
    set_previous_path
  end

  def create
    post_id = params[:post_id]
    post = Post.find(post_id)
    @comment = post.comments.new(users_posts_comment_params)
    @comment.user = current_user
    @comment.save

    form = render_to_string('users/posts/comments/_form',
      layout: false,
      locals: {
        url: users_posts_comments_path,
        post: post,
        comment: Comment.new
      }
    )

    comments = render_to_string('shared/_post_comments',
      layout: false,
    locals: {
        post: post
      }
    )

    render json: {
      form: form,
      comments: comments
    }
  end

  def vote
    type = params[:type]
    @comment.vote_by voter: current_user, vote: type
  end

  def update
    if @comment.update(users_posts_comment_params)
      flash[:notice] = 'Comment updated succesfully!'
      redirect_to_previous_path
    else
      flash[:danger] = 'Something went wrong. Please try again.'
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
