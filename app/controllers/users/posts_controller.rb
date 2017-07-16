class Users::PostsController < ApplicationController
  before_action :set_users_post, only: [:show, :edit, :update, :destroy]

  # GET /users/posts
  # GET /users/posts.json
  def index
    @users_posts = current_user.posts
  end

  # GET /users/posts/1
  # GET /users/posts/1.json
  def show

  end

  # GET /users/posts/new
  def new
    @users_post = current_user.posts.new
  end

  # GET /users/posts/1/edit
  def edit
  end

  # POST /users/posts
  # POST /users/posts.json
  def create
    @users_post = Post.new(users_post_params)
    @users_post.user = current_user
    respond_to do |format|
      if @users_post.save
        format.html { redirect_to users_post_path(@users_post), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @users_post }
      else
        format.html { render :new }
        format.json { render json: @users_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/posts/1
  # PATCH/PUT /users/posts/1.json
  def update
    respond_to do |format|
      if @users_post.update(users_post_params)
        format.html { redirect_to users_post_url(@users_post), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @users_post }
      else
        format.html { render :edit }
        format.json { render json: @users_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/posts/1
  # DELETE /users/posts/1.json
  def destroy
    @users_post.destroy
    respond_to do |format|
      format.html { redirect_to users_posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def vote
    id = params[:id]
    type = params[:type]
    post = Post.find(id)
    post.vote_by voter: current_user, vote: type
    render json: { partial: render_to_string('shared/_post_votes', layout: false, locals: { post: post }) }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_post
      @users_post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def users_post_params
      params.require(:post).permit(:title, :body, :user_id)
    end
end
