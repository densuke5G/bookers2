class RelationshipsController < ApplicationController
  def follows
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end

  def create
    # user = User.find(params[:user_id])
    current_user.follow(params[:user_id])

    redirect_to request.referer
  end

  def destroy
    # user = User.find(params[:user_id])
    current_user.unfollow(params[:user_id])

    redirect_to request.referer
  end
end
