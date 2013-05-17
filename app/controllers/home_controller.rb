class HomeController < ApplicationController
  def index
    @popular = GoogleBooks.search('go the fuck to sleep', {:count => 4, :page =>  1,:api_key => ENV["GOOGLE_API_KEY"]})
    @clubbing = GoogleBooks.search('seal', {:count => 4, :page =>  1,:api_key => ENV["GOOGLE_API_KEY"]})
    
    if !session[:state]
      state = (0...13).map{('a'..'z').to_a[rand(26)]}.join
      session[:state] = state
    end
    state = session[:state]

    response = File.read('index.html').sub(/[{]{2}\s*STATE\s*[}]{2}/, state)
    response = response.sub(/[{]{2}\s*CLIENT_ID\s*[}]{2}/, $credentials.client_id)
    response = response.sub(/[{]{2}\s*APPLICATION_NAME\s*[}]{2}/, APPLICATION_NAME)
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

  def add

  end

  def search
    # need to add ISBN id + author id maby +
    search = params[:search]
    @books = GoogleBooks.search(search, {:count => 40, :page =>  1,:api_key => ENV["GOOGLE_API_KEY"]}) 

  end
end
