class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @book_comment = BookComment.new(book_comment_params)
    @book_comment.user_id = current_user.id
    @book_comment.book_id = @book.id

    @book_comment.save
    flash[:notice] = 'Book comment was successfully created.'
    # redirect_to book_path(book)

  end

  def destroy
    @book_comment = BookComment.find(params[:id]).destroy
    @book = Book.find(params[:book_id])
    # redirect_to book_path(params[:book_id])

  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
