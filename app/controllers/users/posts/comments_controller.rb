class Users::Posts::CommentsController < ApplicationController
  before_action :set_users_posts_comment, only: [:show, :edit, :update, :destroy]

  # GET /users/posts/comments
  # GET /users/posts/comments.json
  def index
    @users_posts_comments = Comment.all
  end

  # GET /users/posts/comments/1
  # GET /users/posts/comments/1.json
  def show
  end

  # GET /users/posts/comments/new
  def new
    @users_posts_comment = Comment.new
  end

  # GET /users/posts/comments/1/edit
  def edit
  end

  # POST /users/posts/comments
  # POST /users/posts/comments.json
  def create
    @users_posts_comment = Comment.new(users_posts_comment_params)

    respond_to do |format|
      if @users_posts_comment.save
        format.html { redirect_to @users_posts_comment, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @users_posts_comment }
      else
        format.html { render :new }
        format.json { render json: @users_posts_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/posts/comments/1
  # PATCH/PUT /users/posts/comments/1.json
  def update
    respond_to do |format|
      if @users_posts_comment.update(users_posts_comment_params)
        format.html { redirect_to @users_posts_comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @users_posts_comment }
      else
        format.html { render :edit }
        format.json { render json: @users_posts_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/posts/comments/1
  # DELETE /users/posts/comments/1.json
  def destroy
    @users_posts_comment.destroy
    respond_to do |format|
      format.html { redirect_to users_posts_comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_posts_comment
      @users_posts_comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def users_posts_comment_params
      params.require(:users_posts_comment).permit(:body, :user_id, :post_id)
    end
end
