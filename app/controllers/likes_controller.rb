class LikesController < ApplicationController

  before_action :set_variables
  def create
    @like = Like.create(
      prototype_id: params[:prototype_id],
      user_id: current_user.id)
    end

  def destroy
    like = Like.find_by(
      prototype_id: params[:prototype_id],
      user_id: current_user.id)
    like.destroy
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
