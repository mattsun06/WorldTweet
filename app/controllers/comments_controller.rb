class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    #コメントと結びつくツイートの詳細画面に遷移
    redirect_to "/tweets/#{comment.tweet.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end
