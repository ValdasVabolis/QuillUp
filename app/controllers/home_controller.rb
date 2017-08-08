class HomeController < ApplicationController
  def index
<<<<<<< HEAD
    @posts = Post.all
=======
    @questions = Question.all.reverse
>>>>>>> comment_nesting
  end
end