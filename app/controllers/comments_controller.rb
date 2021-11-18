class CommentsController < ApplicationController

  def create
    @hobby = Hobby.find(params[:hobby_id])
    @comment = current_user.comments.new(comment_params)
    @comment.hobby_id = @hobby.id
    @comment.save
  end

  def destroy
    @hobby = Hobby.find(params[:hobby_id])
    @comment = Comment.find_by(id: params[:id], hobby_id: params[:hobby_id])
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
