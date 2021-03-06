class HomeController < ApplicationController


  def index
    @popular = GoogleBooks.search('great gastby', {:count => 4, :page =>  1,:api_key => ENV["GOOGLE_API_KEY"]})
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

  def book
    book_isbn = "isbn#{params[:isbn]}"
    @book = GoogleBooks.search(book_isbn, {:count=> 1, :page => 1, :apie_key => ENV["GOOGLE_API_KEY"]})
    @book = @book.first
  end
end 