class RelaionshipsController < ApplicationController
  def follows
  end
  
  def followers
  end

  def create
    user = User.find(params[:id])
    relationship = Relationship.new(followed_id: user.id)
    
    relationship.save
    redirect_back fallback_location: root_path
  end

  def destroy
    user = User.find(params[:id])
    relationship = Relationship.find_by(followed_id: user.id)
    
    relationship.destroy
    redirect_back fallback_location: root_path
  end
end
