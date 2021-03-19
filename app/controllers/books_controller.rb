class BooksController < ApplicationController

  def create
    @book = Book.new(params[:id])
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "book was successfully created"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.all
    @book = Book.new
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "book was successfully updated"
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
    
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  private
  def book_params
  params.require(:book).permit(:title, :body, :image)
  end

end