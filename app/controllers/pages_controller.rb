class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @upload = Upload.new
  end

  def wedding
  end

  def photos
  end

  def travel
    # if params[:email].present?
    #   flash[:notice] = "Thank you for completing your RSVP!"
    # end
  end

  def schedule
  end

  def question
  end

  def registry
  end
end
