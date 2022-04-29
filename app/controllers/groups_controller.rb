class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    @groups = Group.all
  end

  def new
    @group_new = current_user.groups.new
    respond_to do |format|
      format.html { render :new, locals: { groups: @group_new } }
    end
  end

  def create
    group_create = Group.new(params.require(:groups).permit(:name, :icon))
    group_create.update(author_id: current_user.id)

    respond_to do |format|
      format.html do
        if group_create.save
          flash[:success] = 'Catagory created successfully'
          redirect_to groups_path
        else
          flash.now[:error] = 'Error: Catagory could not be created'

          render :new, locals: { groups: @group_new }
        end
      end
    end
  end
end
