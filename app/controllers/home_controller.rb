class HomeController < ApplicationController
  def index
  	  @head = "users"
  	  @user = User.find(:all)
  	  @club = Club.find(:all)
  	  @book = Book.find(:all)
  end
  def books
  	@book = Book.find(:all)
  end

  def book
  	@book = Book.find_by_name(params[:name])
  end

  def users
  	@user = User.find(:all)
  end

  def user
    @user = User.find_by_name(params[:name])
  end

  def clubs
  	@club = Club.find(:all)
  end

  def club
    @club = Club.find_by_name(params[:name])
  end
end
