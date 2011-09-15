class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private 
  
  def office_location 
      Location.find(session[:office_id])
    rescue ActiveRecord::RecordNotFound
      office = Location.create(:name => "office", :address => "1500 N Patterson St. Valdosta GA 31698")
      session[:office_id] = office.id
      office
    end
end
