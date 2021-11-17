class HobbiesController < ApplicationController

  def index
  end

  def games
    @hobbies = Hobby.where(category:"games").order(created_at: :desc)
    @hobby = Hobby.new
    @user = current_user
  end

  def sports
    @hobbies = Hobby.where(category:"sports").order(created_at: :desc)
    @hobby = Hobby.new
    @user = current_user
  end

  def movies
    @hobbies = Hobby.where(category:"movies").order(created_at: :desc)
    @hobby = Hobby.new
    @user = current_user
  end

  def sightseeing
    @hobbies = Hobby.where(category:"sightseeing").order(created_at: :desc)
    @hobby = Hobby.new
    @user = current_user
  end

  def books
    @hobbies = Hobby.where(category:"books").order(created_at: :desc)
    @hobby = Hobby.new
    @user = current_user
  end

  def show
    @hobby = Hobby.find(params[:id])
    @comment = Comment.new
    @user = User
  end

  def create
    @hobby = Hobby.new(hobby_params)
    @hobby.user_id = current_user.id
    @hobby.save
    redirect_back(fallback_location: root_path)
  end

  def edit
  end

  def destroy
    hobby = Hobby.find(params[:id])
    hobby.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def hobby_params
    params.require(:hobby).permit(:name, :title, :introduction, :good_part, :bad_part, :image, :rate, :category)
  end
end
