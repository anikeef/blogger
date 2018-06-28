class CommentsController < ApplicationController
  before_action :require_login, except: [:create]

  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
    if @comment.author_name == ""
      flash.notice = "You can not add comment without name"
    else
      @comment.save
    end

    redirect_to article_path(@comment.article)
  end

  def comment_params
    params.require(:comment).permit(:author_name, :body)
  end
end
