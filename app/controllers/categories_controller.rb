class CategoriesController < ApplicationController

  def index
    @tags = Tag.all.order(:name)
  end

  def show
    tag_name = params[:id]
    @tag = Tag.find_by_name(tag_name)
  end
end
