class TagsController < ApplicationController

  def index
    @tag = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
    @prototype = @tag.prototypes
  end

  def destroy

  end
end
