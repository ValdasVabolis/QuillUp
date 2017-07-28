class Users::Posts::CommentsController < ApplicationController
  before_action :set_users_posts_comment, only: [:show, :edit, :update, :destroy]

  # GET /users/posts/comments
  # GET /users/posts/comments.json
  def index
    @comments = Comment.all
  end

  # GET /users/posts/comments/1
  # GET /users/posts/comments/1.json
  def show
  end

  # GET /users/posts/comments/new
  def new
    @comment = Comment.new
  end

  # GET /users/posts/comments/1/edit
  def edit
  end

  # POST /users/posts/comments
  # POST /users/posts/comments.json
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
    id = params[:id]
    type = params[:type]
    @comment = Comment.find(id)
    @comment.vote_by voter: current_user, vote: type
  end

  # PATCH/PUT /users/posts/comments/1
  # PATCH/PUT /users/posts/comments/1.json
  def update
    respond_to do |format|
      if @comment.update(users_posts_comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/posts/comments/1
  # DELETE /users/posts/comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to users_posts_comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_posts_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def users_posts_comment_params
      params.require(:comment).permit(:body, :user_id)
    end
end
