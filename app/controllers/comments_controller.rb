class CommentsController < ApplicationController
  before_action :authenticate_user!, :only => [:create]

  def show
    @comments = Comment.all
  end

  def create
    @company = Company.find(params[:company_id])

    @comment = @company.comments.new(comment_params.merge(user_id: current_user.id))
    respond_to do |format|
      if @comment.save
        redirect_to @company, notice: 'Comment was successfully created.'

      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :comment, :rating)
  end
end
 
