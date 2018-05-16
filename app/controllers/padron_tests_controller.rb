class PadronTestsController < ApplicationController
  def index
  	if params[:name]
      @padron_tests = PadronTest.search(params).order("created_at DESC").paginate(:page => params[:page], :per_page => 15)
    else
      @padron_tests = PadronTest.paginate(:page => params[:page], :per_page => 15)
    end
  end

  def map
  end
end
