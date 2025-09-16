class UploadsController < ApplicationController
  def index
    @photos = Upload.order(created_at: :desc).map(&:photos).flatten
    @upload = Upload.new
  end

  def create
    @upload = Upload.create(upload_params)
    redirect_to uploads_path(tab: 'uploads'), notice: "Photos uploaded successfully"
  end

  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy
    redirect_to uploads_path(tab: 'uploads'), notice: "Photos deleted successfully"
  end

  private

  def upload_params
    params.require(:upload).permit(photos: [])
  end
end
