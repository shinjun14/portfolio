class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.admin == false
      redirect_to user_path(current_user.id)
    end
    @user = User.all
    @osusume = Hobby.all.order(created_at: :desc).limit(3)
  end

  def show
    @user = User.find(params[:id])
    @hobbies = @user.hobbies
    @hobby = Hobby
    @osusume = Hobby.all.order(created_at: :desc).limit(3)
  end

  def bookmarks
    @favorites = Favorite.where(user_id: current_user.id)
    @user = current_user
    @osusume = Hobby.all.order(created_at: :desc).limit(3)
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "変更完了"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def unsubscribe
    @user = User.find_by(email: params[:email])
  end

  def withdraw
    @user = User.find(current_user.id)
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end



  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  def user_admin
    @users = User.all
    if current_user.admin == false
        redirect_to user_path(@user.id)
    else
      render action: "index"
    end
  end

end
