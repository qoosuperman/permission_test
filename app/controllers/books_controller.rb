class BooksController < ApplicationController
  authorize_resource
  
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.new(book_params)
    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit(
      :name
    )
  end
end
