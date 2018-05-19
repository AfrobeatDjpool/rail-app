class HomeController < ApplicationController
  def index
  	@cars = Rent.paginate(:page => params[:page], :per_page => 15)

  end
end
