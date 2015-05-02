class GroupsController < ApplicationController

  def index
    @groups = Group.all.order(:name)
  end

  def show
    @group = Group.find_by_name(params[:id])
  end
end
