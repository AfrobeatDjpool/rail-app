class SongsController < ApplicationController
  before_action :authenticate_user!
  def index
  	@songs = Song.all.paginate(:page => params[:page], :per_page => 30)
  end

  def mysong
    @songs = current_user.songs.paginate(:page => params[:page], :per_page => 30)
  end

  def show
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
    
  end

  def update
    @song = Song.find(params[:id])
    @song.update(admin_song_params)
    flash[:notice] = "Your song was updated!"
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy

    redirect_to root_path
  end

  private
    def set_admin_song
      @admin_song = Admin::Song.find(params[:id])
    end

    def admin_song_params
      params.require(:admin_song).permit(:user_id, :name_song, :beats, :genre, :version, :name_artist, :date_uploaded)
    end

end