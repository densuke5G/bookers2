class BooksController < ApplicationController

  # before_action :is_matching_login_user_book, only: [:edit, :update]

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.new
    @bookp = Book.find(params[:id])
    @user = User.find(@bookp.user_id)
  end

  def edit
    book = Book.find(params[:id])
    unless book.user_id == current_user.id
      redirect_to books_path
    end
    
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @books = Book.all
    @user = current_user
    @book.user_id = current_user.id

    if @book.save
      flash[:notice] = "Book has posted successfully!"
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book has edited successfully!"
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
    params.require(:book).permit(:title, :body)
  end
  
end
