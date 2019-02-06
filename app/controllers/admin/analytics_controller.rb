class Admin::AnalyticsController < ApplicationController

  # GET /companies
  # GET /companies.json
  def index
    @users = User.all.paginate(:page => params[:page], :per_page => 15)
  end


end
