class PagesController < ApplicationController
  def home
  @users_posts = Post.all
  end
end