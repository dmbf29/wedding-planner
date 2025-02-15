class InvitationsController < ApplicationController
  def index
    if params[:name].present?
      first, last = params[:name].split
      @person = Person.find_by(first_name: first, last_name: last)
      # TODO: fix this 👇
      @group = @person.group if @person
    end
  end

  def update
    @invitation = Invitation.find(params[:id])
    @invitation.update(invitation_params)
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          partial: "invitiations/invitation",
          target: "invitation_#{@invitation.id}",
          locals: { invitation: @invitation }
        )
      end
      format.html { redirect_to group_path(@invitation.person.group) }
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit(:status)
  end
end
