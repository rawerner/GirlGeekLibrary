require 'googlebooks'

class BooksController < ApplicationController
  # before_filter :load_books

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

  def search
    @googleBooks = GoogleBooks.search(params[:book_title], {:langRestrict => 'en', :count => 3, :order_by => 'newest', :api_key => 'AIzaSyD81T6xmfnGYIzxCOMkPwlgpE8Orny7wq0'})
  end


private


  def book_params
    params.require(:book).permit(:title, :author, :cover_thumbnail,
                                 :cover_image, :content_version, :publisher,
                                 :published_date, :description, :categories,
                                 :average_rating, :ratings_count, :user_id
                                 )
  end
end
