class PartiesController < ApplicationController
  def show
    @party = Party.find(params[:id])
    @party.viewed!
    @events = Event.all
  end
end
