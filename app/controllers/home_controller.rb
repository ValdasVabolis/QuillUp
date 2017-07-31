class HomeController < ApplicationController
  def index
    @users_posts = Post.all
  end
end