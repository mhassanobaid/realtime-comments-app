class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def create
    @comment = Comment.create(comment_params)
    ActionCable.server.broadcast("comments_channel", { body: @comment.body })
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
