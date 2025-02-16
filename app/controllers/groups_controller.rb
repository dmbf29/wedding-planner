class GroupsController < ApplicationController
  def show
    @group = Group.find(params[:id])
    @events = Event.order(date: :asc)
    @current_event = params[:page].present? ? @events[params[:page].to_i] : @events.first
    @index = @events.index(@current_event)
    @invitations = @group.invitations.where(event: @current_event)
  end
end
