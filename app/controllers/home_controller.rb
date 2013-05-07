class HomeController < ApplicationController
  def index
  	  @head = "users"
  	  @user = User.find(:all)
  	  @club = Club.find(:all)
  	  @book = Book.find(:all)
  end
end
