class CommentsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @comment = Comment.new
    @inspection = Inspection.find_by_id(params[:id])


  end

  def create

    @comment = Comment.new(comment_params)
    @comment.inspection_id = Inspection.find_by_id(params[:id])
    @inspection = Inspection.find_by_id(params[:id])


    if @comment.save
      
      redirect_to admin_path(current_admin)
    else
      flash[:error] = @comment.errors.full_messages.join(", ")
    end


  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def comment_params
      params.require(:comment).permit(:inspection_id, :title, :inspection_status)
    end

end
