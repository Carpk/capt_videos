class CategoriesController < ApplicationController

  def index
    @tags = Tag.tag_names
  end

  def show
    tag_name = params[:id]
    @tag = Tag.find_by_name(tag_name)
  end
end
