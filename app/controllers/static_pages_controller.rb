class StaticPagesController < ApplicationController
  def home
    @books = Book.all
  end

  def howitworks
  end

  def about
  end

  def contact
  end

end