class CommentsController < ApplicationController
  include CommentsHelper
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]

    @comment.save

    flash.notice = "Comment by '#{@comment.author_name}' Created!"

    redirect_to article_path(@comment.article)
  end

end