class CalculatorController < ApplicationController

  helper_method :current_city
  helper_method :hours
  helper_method :monthly_earnings
  helper_method :due_at_signing
  helper_method :hybrid_monthly_gas
  helper_method :monthly_gas
  helper_method :monthly_cost_living
  helper_method :car_lease

  #Class variables for calculating cost of living in cities
  @@allCities = {'1' => "San Francisco", '2' => "New York City", '3' => "Dallas"}
  @@monthlyCostOfLiving = { '1' => 3500, '2' => 3000, '3' => 2500 }
  @@monthly40HourEarnings = { '1' => 7500, '2' => 7500, '3' => 5000 }
  @@monthlyGasCost = { '1' => 1250, '2' => 1000, '3' => 1000 }
  @@monthlyHybridGasCost = { '1' => 1000, '2' => 750, '3' => 750 }
  @@averageCarLease = 250
  @@averageDueAtSigning = 2500
  
  
  def self.all_cities
  	@@allCities
  end

  def index
  end
  
  def submit
  	@city = params[:city]
  	@hours = params[:hours]
  	
  	render :action => 'index'
  	
  end
  
  def hours
  	@hours
  end
  
  def current_city
  	@@allCities[@city]
  end
  
  def monthly_earnings
  	@@monthly40HourEarnings[@city] * (hours.to_f / 40.to_f)
  end
  
  def due_at_signing
  	@@averageDueAtSigning
  end
  
  def hybrid_monthly_gas
  	@@monthlyHybridGasCost[@city]
  end
  
  def monthly_gas
  	@@monthlyGasCost[@city]
  end
  
  def monthly_cost_living
  	@@monthlyCostOfLiving[@city]
  end
  
  def car_lease
  	@@averageCarLease
  end
  
end
