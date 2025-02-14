class GroupsController < ApplicationController
  def show
    @group = Group.find(params[:id])
    @group.viewed!
    @events = Event.order(date: :asc)
  end
end
