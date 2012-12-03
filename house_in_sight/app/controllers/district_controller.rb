class DistrictController < ApplicationController
  # GET /district/1/communities.json
  def communities
    logger.info "download communities"
    @district = District.find(params[:id])
    @communities = @district.communities
    respond_to do |format|
      format.json { render json: @district }
      format.js
    end

  end

  # GET /districts/1
  # GET /districts/1.json
  def show
    @district = District.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @district }
    end
  end

end
