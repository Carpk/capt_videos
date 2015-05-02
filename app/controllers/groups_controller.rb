class GroupsController < ApplicationController

  def index
    @groups = Group.all.order(:name)
  end
end
