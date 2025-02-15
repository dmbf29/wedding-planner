class GroupsController < ApplicationController
  def show
    @group = Group.find(params[:id])
    @events = Event.order(date: :asc)
  end
end
