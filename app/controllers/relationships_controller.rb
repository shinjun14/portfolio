class RelationshipsController < ApplicationController

  #フォローする、フォロー外す
  def create
    current_user.follow(params[:user_id])
    @user = User.find(params[:user_id])
  end

  def destroy
    current_user.unfollow(params[:user_id])
    @user =  User.find(params[:user_id])
  end

  #view
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
    @osusume = Hobby.all.order(created_at: :desc).limit(3)
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
    @osusume = Hobby.all.order(created_at: :desc).limit(3)
  end

end
