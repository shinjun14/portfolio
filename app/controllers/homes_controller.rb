class HomesController < ApplicationController

  def top
    @user = User
    @hobby = Hobby
  end

  def about
    @osusume = Hobby.all.order(created_at: :desc).limit(3)
  end

  def terms
    @user = User
    @hobby = Hobby
    @osusume = Hobby.all.order(created_at: :desc).limit(3)
  end

end
