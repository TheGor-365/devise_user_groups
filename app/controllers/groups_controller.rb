class GroupsController < ApplicationController
  before_action :set_group, only: %i[ show edit update destroy join leave ]

  def index
    @groups = Group.all
  end

  def show; end
  def edit; end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.save ? (redirect_to group_url(@group)) : (render :new)
  end

  def update
    @group.update(group_params) ? (redirect_to group_url(@group)) : (render :edit)
  end

  def destroy
    @group.destroy
    redirect_to groups_url
  end

  def join
    @group.users << current_user
    redirect_to group_url(@group)
  end

  def leave
    @group.users.delete(current_user)
    redirect_to group_url(@group)
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name)
  end
end
