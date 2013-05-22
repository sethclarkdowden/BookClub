class HomeController < ApplicationController


  def index
    @popular = GoogleBooks.search('go the fuck to sleep', {:count => 4, :page =>  1,:api_key => ENV["GOOGLE_API_KEY"]})
    @clubbing = GoogleBooks.search('seal', {:count => 4, :page =>  1,:api_key => ENV["GOOGLE_API_KEY"]})
    
    if !session[:state]
      state = (0...13).map{('a'..'z').to_a[rand(26)]}.join
      session[:state] = state
    end
    state = session[:state]
  end

  def search
    # need to add ISBN id + author id maby +
    search = params[:search]
    @books = GoogleBooks.search(search, {:count => 40, :page =>  1,:api_key => ENV["GOOGLE_API_KEY"]}) 

  end
end
