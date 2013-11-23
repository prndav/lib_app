class BooksController < ApplicationController
  def index

  end
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.save
    flash[:success] = 'Book was successfully created.'
    redirect_to books_url
  end

  private

    def book_params
      params.require(:book).permit(:title, :author, :pages, :description)
    end
end
