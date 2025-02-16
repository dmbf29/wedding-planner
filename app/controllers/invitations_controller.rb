class InvitationsController < ApplicationController
  def index
    if params[:name].present?
      first, last = params[:name].split
      @person = Person.find_by(first_name: first, last_name: last) || Person.find_by(first_name: last, last_name: first) || Person.find_by(first_name: first) || Person.find_by(last_name: last) || Person.find_by(first_name: last) || Person.find_by(last_name: first)
      @group = @person.group if @person
    end
  end

  def update
    @invitation = Invitation.find(params[:id])
    @invitation.update(invitation_params)
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("invitation-#{@invitation.id}",
          partial: "invitations/invitation",
          locals: { invitation: @invitation, solo: @invitation.person.group.people.count == 1, can_bring_guest: @invitation.event != @invitation.event.celebration.events.order(date: :asc).last }
        )
      end
      format.html { redirect_to group_path(@invitation.person.group) }
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit(:status, :wants_guest, :notes)
  end
end
