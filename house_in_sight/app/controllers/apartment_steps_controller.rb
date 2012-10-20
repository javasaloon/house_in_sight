class ApartmentStepsController < ApplicationController
  include Wicked::Wizard
  steps :basic, :building, :fee

  def show 
    if not session[:current_apartment_id]
      @apartment = Apartment.new  
    else
      begin
        @apartment = Apartment.find(session[:current_apartment_id])
      rescue Exception => e
        logger.info "Apartment not fount by apartment_id #{session[:current_apartment_id]}"
        @apartment = Apartment.new 
      end
    end
    session[:current_apartment_id] = @apartment.id
    render_wizard
  end
  
  def update 
    if session[:current_apartment_id]
      begin
        @apartment = Apartment.find(session[:current_apartment_id])
      rescue Exception
        logger.info "Apartment not fount by apartment_id #{session[:current_apartment_id]}"
        @apartment = Apartment.create(:id=>session[:current_apartment_id])
      end
    end
    
    @apartment.update_attributes(params[:apartment])

    render_wizard @apartment
  end 

  def finish_wizard_path
    @apartment = Apartment.find(session[:current_apartment_id])
    session[:current_apartment_id] = nil
    apartment_path(@apartment)
  end

end
