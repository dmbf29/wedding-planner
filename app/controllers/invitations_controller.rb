class InvitationsController < ApplicationController
  def index
    if params[:name].present?
      first, last = params[:name].split
      @person = Person.find_by(first_name: first, last_name: last)
      # TODO: mark the party as "read"
      # TODO: fix this 👇
      @party = @person.parties.first if @person
    end
  end
end
