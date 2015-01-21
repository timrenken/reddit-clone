class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @comments = Comment.all
  end

  def show
    respond_with(@comment)
	authorize! :read, @comment
  end

  def new
    @comment = Comment.new
    respond_with(@comment)
  end

  def edit
  end

  def create
  @link = Link.find(params[:link_id])
  @comment = @link.comments.new(comment_params)
  @comment.user = current_user
 
  respond_to do |format|
    if @comment.save
      format.html { redirect_to @link, notice: 'Comment was successfully created.' }
      format.json { render json: @comment, status: :created, location: @comment }
    else
      format.html { render action: "new" }
      format.json { render json: @comment.errors, status: :unprocessable_entity }
    end
  end
end
 

  def update
    @comment.update(comment_params)
    respond_with(@comment)
  end

  def destroy
    @comment.destroy
	redirect_to :back
  end

def upvote
  @comment = Comment.find(params[:id])
  @comment.upvote_by current_user
  redirect_to :back
end
 
def downvote
  @comment = Comment.find(params[:id])
  @comment.downvote_by current_user
  redirect_to :back
end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:link_id, :body, :user_id)
    end
end
