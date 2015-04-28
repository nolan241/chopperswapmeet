class CommentsController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
      @comment.user_id = current_user.id 
     if @comment.save
      # should return to pin
      redirect_to :back, notice: "Comment was successfully created."
    else
      redirect_to :root, notice: "Error creating comment"
    end

  end

  def edit
  end


  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:body,:user_id,:pin_id)
  end

  def correct_user
    @comment = current_user.comment.find_by(id: params[:id])
    redirect_to pins_path, notice: "Not authorized to edit this pin" if @comment.nil?
  end

end