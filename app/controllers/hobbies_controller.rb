class HobbiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @osusume = Hobby.all.order(created_at: :desc).limit(3)
  end

  def games
    @hobbies = Hobby.where(category:"games").order(created_at: :desc)
    @hobby = Hobby.new
    @user = current_user
    @osusume = Hobby.all.order(created_at: :desc).limit(3)
  end

  def sports
    @hobbies = Hobby.where(category:"sports").order(created_at: :desc)
    @hobby = Hobby.new
    @user = current_user
    @osusume = Hobby.all.order(created_at: :desc).limit(3)
  end

  def movies
    @hobbies = Hobby.where(category:"movies").order(created_at: :desc)
    @hobby = Hobby.new
    @user = current_user
    @osusume = Hobby.all.order(created_at: :desc).limit(3)
  end

  def sightseeing
    @hobbies = Hobby.where(category:"sightseeing").order(created_at: :desc)
    @hobby = Hobby.new
    @user = current_user
    @osusume = Hobby.all.order(created_at: :desc).limit(3)
  end

  def books
    @hobbies = Hobby.where(category:"books").order(created_at: :desc)
    @hobby = Hobby.new
    @user = current_user
    @osusume = Hobby.all.order(created_at: :desc).limit(3)
  end

  def show
    @hobby = Hobby.find(params[:id])
    @comment = Comment.new
    @user = User
    @osusume = Hobby.all.order(created_at: :desc).limit(3)
  end

  def create
    @hobby = Hobby.new(hobby_params)
    @hobby.user_id = current_user.id
    if @hobby.save
      @tags = Vision.get_image_data(@hobby.image)
      @tags.each do |tag|
        @hobby.tags.create(name: tag)
      end
      redirect_back(fallback_location: root_path)

    elsif @hobby.category == "sports"
      @hobbies = Hobby.where(category:"sports").order(created_at: :desc)
      @osusume = Hobby.all.order(created_at: :desc).limit(3)
      @user = current_user
      render :sports

    elsif @hobby.category == "movies"
      @hobbies = Hobby.where(category:"movies").order(created_at: :desc)
      @osusume = Hobby.all.order(created_at: :desc).limit(3)
      @user = current_user
      render :movies

    elsif @hobby.category == "sightseeing"
      @hobbies = Hobby.where(category:"sightseeing").order(created_at: :desc)
      @osusume = Hobby.all.order(created_at: :desc).limit(3)
      @user = current_user
      render :sightseeing

    elsif @hobby.category == "books"
      @hobbies = Hobby.where(category:"books").order(created_at: :desc)
      @osusume = Hobby.all.order(created_at: :desc).limit(3)
      @user = current_user
      render :books

    else
      @hobbies = Hobby.where(category:"games").order(created_at: :desc)
      @osusume = Hobby.all.order(created_at: :desc).limit(3)
      @user = current_user
      render :games
    end
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
