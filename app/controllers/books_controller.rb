class BooksController < ApplicationController
  def index
    @books = Book.all.sort_by(&:title)
  end

  def show
    @book = Book.find(params[:id])
    @copies = @book.copies
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = "Book edited."
      redirect_to books_path
    else
      render "edit"
    end
  end

  def destroy
    Book.find(params[:id]).destroy
    flash[:success] = "Book deleted"
    redirect_to books_path
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "New book created."
      redirect_to books_path
    else
      render "new"
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :ISBN)
  end
end
