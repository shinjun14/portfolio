class CommentsController < ApplicationController

  def create
    @hobby = Hobby.find(params[:hobby_id])
    @comment = current_user.comments.new(comment_params)
    @comment.hobby_id = @hobby.id
    @comment.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
