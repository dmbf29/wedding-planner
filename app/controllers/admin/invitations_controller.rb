class Admin::InvitationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = Event.order(date: :asc)
  end
end
