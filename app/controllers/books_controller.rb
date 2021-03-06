class BooksController < ApplicationController
  def show
  	@book = Book.find(params[:id])
  end

  def index
  	@books = Book.all
  	@book  = Book.new
  end

  def new
  	@book = Book.new
  	# 空のモデルをビューへ渡す
  end

  def create
  	book = Book.new(book_params)
  	book.save
  	flash[:notice] = "Book is successfully created"
  	redirect_to book_path(book.id)
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	book = Book.find(params[:id])
  	book.update(book_params)
  	redirect_to book_path([book.id])
  end
  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	flash[:notice] = "Book wad successfully destroyed."
  	redirect_to books_path
  end

  private
  def book_params
  	params.require(:book).permit(:title, :category, :body)
  end
end
