class CategoriesController < ApplicationController

  def index
    @tags = Tag.all
  end
end
