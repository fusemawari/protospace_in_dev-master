class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]

  def index
      @prototypes = Prototype.all

  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
    @prototype.tags.build
  end

  def create
     @prototype = Prototype.new(prototype_params)
     # name_tags = @prototype.tags
    if @prototype.save

#        @tags = @prototype.save_tags(name_tags)
# binding.pry
      redirect_to :root, notice: '投稿完了'
    else
      redirect_to ({ action: 'new' }), alert: '登録できてねーっっっぞ'
     end
  end

  def destroy
     if @prototype.user_id == current_user.id
      @prototype.destroy
      redirect_to root_path, notice: "削除しました"
    end
  end

  def show
    @comment = Comment.new
    @like = Like.new()
    @comments = @prototype.comments
    @tag_list = @prototype.tags
  end

  def edit
  end

  def update
    if @prototype.update(prototype_params)
    redirect_to root_path, notice: '変更完了'
  else
    redirect_to edit_prototype_path(@prototype), alert: '変更失敗・・・'
  end
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      :user_id,
      :tag_name,
      captured_images_attributes: [:content, :status, :id],
      tags_attributes: [:id, :name]
    )
  end
end
