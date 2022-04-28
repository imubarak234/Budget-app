class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    @groups = Group.all
  end

  def new
    @group_new = current_user.group.new
    respond_to do | format |
      format.html { render :new, locals: { groups: @group_new } }
    end
  end
end
