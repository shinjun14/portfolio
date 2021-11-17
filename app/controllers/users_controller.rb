class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @hobbies = @user.hobbies
    @hobby = Hobby
  end

  def bookmarks
    @favorites = Favorite.where(user_id: current_user.id)
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
