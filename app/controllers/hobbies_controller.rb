class HobbiesController < ApplicationController

  def index
    @hobbies = Hobby.all
    @hobby = Hobby.new
  end

  def games
    @hobbies = Hobby.all
    @hobby = Hobby.new
  end

  def sports
  end

  def sightseeing
  end

  def movies
  end

  def show
  end

  def create
    @hobby = Hobby.new(hobby_params)
    @hobby.save
    redirect_back(fallback_location: root_path)
  end

  def edit
  end

  def destroy
  end

  private

  def hobby_params
    params.require(:hobby).permit(:name, :title, :introduction, :good_part, :bad_part, :image, :rate)
  end
end
