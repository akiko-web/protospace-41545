class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype)  # 成功したら詳細ページにリダイレクト
    else
      @prototype = @comment.prototype
      @comments = @prototype.comments
      render "prototypes/show"  # 失敗したら詳細ページに戻る
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
