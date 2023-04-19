class UsersController < ApplicationController

  # before_action :is_matching_login_user, only: [:edit, :update]

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end

    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "Userinfo has edited successfully!"
      redirect_to user_path(@user.id)
    else
      render :edit
    end

  end


  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
