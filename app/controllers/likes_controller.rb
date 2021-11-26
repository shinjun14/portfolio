class LikesController < ApplicationController

  def create
    @hobby = Hobby.find(params[:hobby_id])
    like = current_user.likes.new(hobby_id: @hobby.id)
    like.save
  end

  def destroy
    @hobby = Hobby.find(params[:hobby_id])
    like = current_user.likes.find_by(hobby_id: @hobby.id)
    like.destroy
  end

end
