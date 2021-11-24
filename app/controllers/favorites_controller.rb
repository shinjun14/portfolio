class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @hobby = Hobby.find(params[:hobby_id])
    favorite = @hobby.favorites.new(user_id: current_user.id)
    if favorite.save
    else
      redirect_to request.referer
    end
  end

  def destroy
    @hobby = Hobby.find(params[:hobby_id])
    favorite = @hobby.favorites.find_by(user_id: current_user.id)
    if favorite.present?
      favorite.destroy
    else
      redirect_to request.referer
    end
  end
end
