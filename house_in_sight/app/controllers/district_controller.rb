class DistrictController < ApplicationController
  # GET /district/1/communities.json
  def communities
    logger.info "download communities"
    @district = District.find(params[:id])
    respond_to do |format|
      format.json { render json: @district }
      format.js
    end

  end
end
