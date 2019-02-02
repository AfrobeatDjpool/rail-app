class SongsController < ApplicationController
  # before_action :authenticate_user!
  def index
  	@songs = Song.all.paginate(:page => params[:page], :per_page => 30)
  end

  def mysong
    @songs = current_user.songs.paginate(:page => params[:page], :per_page => 30)
  end

  def show
    @songs = Song.find(params[:id])
  end

end