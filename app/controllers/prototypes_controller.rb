class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]

  def index
      @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
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


  end

  def edit
    @main = @prototype.captured_images[0]
    @sub  = @prototype.captured_images.sub
    # binding.pry
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
      captured_images_attributes: [:content, :status, :id]
    )
  end
end
