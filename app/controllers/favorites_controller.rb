class FavoritesController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    favorite = Favorite.new(book_id: book.id)
    favorite.user_id = current_user.id
    # favorite.book_id = book.id
    @book = Book.find(params[:book_id])

    favorite.save
    # redirect_back fallback_location: root_path
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = Favorite.find_by(book_id: book.id)
    favorite.user_id = current_user.id
    # favorite.book_id = book.id
    @book = Book.find(params[:book_id])

    favorite.destroy
    # redirect_back fallback_location: root_path
  end
end
