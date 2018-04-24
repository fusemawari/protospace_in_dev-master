class CommentsController < ApplicationController

  before_action :set_prototype

  def create
     @comment = Comment.new(comment_params)
    if  @comment.save
      @comments = @prototype.comments.length
      respond_to do |format|
        format.json
        format.html{redirect_to prototype_path(@prototype)}
     # binding.pry
      end
   else redirect_to prototype_path(@prototype), alert: 'コメントに失敗しました'
     end
  end

  def destroy
    @comment = @prototype.comments.find(params[:id])
      if @comment.user_id == current_user.id
        @comment.destroy
        redirect_to prototype_path(@prototype), notice: '削除しました'
      else
        redirect_to prototype_path(@prototype), alert: '削除に失敗しました'
      end
  end

  def edit
     @comment = @prototype.comments.find(params[:id])
       respond_to do |format|
        format.html { redirect_to prototype_path(@prototype) }
        format.json { @id_comment = @comment.id }
       end

  end

  def update
    @comment = @prototype.comments.find(params[:id])
       @comment.update(comment_params)
        # respond_to do |format|
        #   format.html { redirect_to prototype_path(@prototype) }
        #   format.json { @id_comment = @comment.id }
        redirect_to prototype_path(@prototype), notice: '編集しました'
        # end
      # else
      #   redirect_to prototype_path(@prototype), alert: '削除に失敗しました'
      # end
  end

  private

  def comment_params
    params.require(:comment).permit(:content,:id).merge(user_id: current_user.id, prototype_id: @prototype.id)

  end
  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end
end

