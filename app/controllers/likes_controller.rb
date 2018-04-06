class LikesController < ApplicationController

  before_action :set_prototype, only: [:create, :destroy]

  def create
    @like = current_user.likes.create(prototype_id: params[:prototype_id])
    @prototypes = Prototype.all
  end

  def destroy
    like = current_user.likes.find_by(prototype_id: params[:prototype_id])
    like.destroy
    @Prototypes = Prototype.all
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end
end
