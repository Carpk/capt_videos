class CategoriesController < ApplicationController

  def index
    @tags = Tag.tag_names
  end
end
