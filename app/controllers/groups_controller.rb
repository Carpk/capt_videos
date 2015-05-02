class GroupsController < ApplicationController

  def index
    @groups = Group.group_names
  end
end
