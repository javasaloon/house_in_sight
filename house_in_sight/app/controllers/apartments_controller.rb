class ApartmentsController < ApplicationController

  # GET /apartments
  # GET /apartments.json
  def index
    @apartment = Apartment.new
    if params[:tag]
      @apartments = Apartment.tagged_with(params[:tag]) 
    else
      @apartments = Apartment.all.order_by([:modified, :desc])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @apartments }
    end
  end
  # GET /apartments/1
  # GET /apartments/1.json
  def show
    @apartment = Apartment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @apartment }
    end
  end

  # GET /apartments/new
  # GET /apartments/new.json
  def new 
    redirect_to apartment_steps_path 
  end

  # GET /apartments/1/edit
  def edit
    #@apartment = Apartment.find(params[:id])
    session[:current_apartment_id] = params[:id]
    redirect_to apartment_steps_path 
  end 
  
  # DELETE /apartments/1
  # DELETE /apartments/1.json
  def destroy
    @apartment = Apartment.find(params[:id])
    @apartment.destroy

    respond_to do |format|
      format.html { redirect_to apartments_url }
      format.json { head :no_content }
    end
  end
end
