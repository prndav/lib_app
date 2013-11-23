class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = 'Book was successfully created.'
      redirect_to books_url
    else
      flash[:notice] = 'Something went wrong'
      render :new
    end
  end

  private

    def book_params
      params.require(:book).permit(:title, :author, :pages, :description)
    end
end
