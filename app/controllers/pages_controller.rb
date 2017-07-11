class PagesController < ApplicationController
   def home
      @users_posts = Users::Post.all
   end
end