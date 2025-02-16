class GroupsController < ApplicationController
  def show
    @group = Group.find(params[:id])
    @events = Event.order(date: :asc)
    @current_event = params[:page].present? ? @events[params[:page].to_i] : @events.first
    @index = @events.index(@current_event)
    @invitations = @group.invitations.where(event: @current_event)
  end

  def email
    @group = Group.find(params[:id])
  end

  def send_email
    @group = Group.find(params[:id])
    @group.people.each do |person|
      UserMailer.with(person: person).rsvp.deliver_now
    end
    redirect_to travel_path, notice: "Thank you for completing your RSVP!"
  end
end
