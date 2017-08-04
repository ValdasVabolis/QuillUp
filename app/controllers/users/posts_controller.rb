class Users::PostsController < ApplicationController
  before_action :set_users_post, only: [:show, :edit, :update, :destroy, :vote]

  def index
    @posts = current_user.posts
  end

  def show
    @comment = Comment.new if user_signed_in?
  end

  def new
    @post = current_user.posts.new
  end

  def edit
    set_previous_path
  end

  def create
    @post = Post.new(users_post_params)
    @post.user = current_user
    respond_to do |format|
      if @post.save
        format.html { redirect_to users_post_path(@post), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @post.update(users_post_params)
      flash[:notice] = 'Post updated succesfully!'
      redirect_to_previous_path
    else
      flash[:danger] = 'Something went wrong. Please try again.'
    end
  end

  def destroy
    @post.soft_delete!
  end

  def vote
    type = params[:type]
    @post.vote_by voter: current_user, vote: type
  end

  private
    def set_users_post
      @post = Post.find(params[:id])
    end

    def users_post_params
      params.require(:post).permit(:title, :body, :user_id)
    end
end
