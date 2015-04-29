class CategoriesController < ApplicationController

  def index
    @tags = Tag.tag_names.sort
  end

  def show
    tag = params[:id]
    @tagged_vids = Tag.where(tag: tag)
  end
end
