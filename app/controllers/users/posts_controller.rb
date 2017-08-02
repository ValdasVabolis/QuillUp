class Users::PostsController < ApplicationController
  before_action :set_users_post, only: [:show, :edit, :update, :destroy]

  # GET /users/posts
  # GET /users/posts.json
  def index
    @posts = current_user.posts
  end

  # GET /users/posts/1
  # GET /users/posts/1.json
  def show
    @comment = Comment.new if user_signed_in?
  end

  # GET /users/posts/new
  def new
    @post = current_user.posts.new
  end

  # GET /users/posts/1/edit
  def edit
  end

  # POST /users/posts
  # POST /users/posts.json
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

  # PATCH/PUT /users/posts/1
  # PATCH/PUT /users/posts/1.json
  def update
    if @post.update(users_postsparams)
      flash[:notice] = "Post updated succesfully!"
      redirect_to root_url
    else
      flash[:danger] = "Something went wrong. Please try again."
    end
  end

  # DELETE /users/posts/1
  # DELETE /users/posts/1.json
  def destroy
    @post.destroy
  end

  def vote
    id = params[:id]
    type = params[:type]
    @post = Post.find(id)
    @post.vote_by voter: current_user, vote: type
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def users_post_params
      params.require(:post).permit(:title, :body, :user_id)
    end
end
