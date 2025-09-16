class Admin::UploadsController < ApplicationController
  before_action :authenticate_user!

  def index
    @uploads = Upload.all
  end
end
