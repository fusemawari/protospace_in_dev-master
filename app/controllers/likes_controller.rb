class LikesController < ApplicationController

  before_action :set_variables
  def create
    @like = Like.new(
      prototype_id: params[:prototype_id],
      user_id: current_user.id)
    @like.save
  end

  def destroy
    @like = Like.find_by(
      prototype_id: params[:prototype_id],
      user_id: current_user.id)
    @like.destroy
    redirect_to prototype_path(@prototype)
  end

  private

    def like_params
      params.require(:like).permit(:prototype_id, :user_id)

    end

    def set_variables
    @prototype = Prototype.find(params[:prototype_id])
    @likes = Like.where(prototype_id: params[:prototype_id])
    @id_name = "#like-link-#{@prototype.id}"
    @id_heart = "#heart-#{@prototype.id}"
    end
end
