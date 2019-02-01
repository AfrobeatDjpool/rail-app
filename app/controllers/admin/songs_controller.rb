class Admin::SongsController < ApplicationController
  before_action :set_admin_song, only: [:show, :edit, :update, :destroy]

  # GET /admin/songs
  # GET /admin/songs.json
  def index
    @admin_songs = Admin::Song.all
  end

  # GET /admin/songs/1
  # GET /admin/songs/1.json
  def show
  end

  # GET /admin/songs/new
  def new
    @admin_song = Admin::Song.new
  end

  # GET /admin/songs/1/edit
  def edit
  end

  # POST /admin/songs
  # POST /admin/songs.json
  def create
    @admin_song = Admin::Song.new(admin_song_params)

    respond_to do |format|
      if @admin_song.save
        format.html { redirect_to @admin_song, notice: 'Song was successfully created.' }
        format.json { render :show, status: :created, location: @admin_song }
      else
        format.html { render :new }
        format.json { render json: @admin_song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/songs/1
  # PATCH/PUT /admin/songs/1.json
  def update
    respond_to do |format|
      if @admin_song.update(admin_song_params)
        format.html { redirect_to @admin_song, notice: 'Song was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_song }
      else
        format.html { render :edit }
        format.json { render json: @admin_song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/songs/1
  # DELETE /admin/songs/1.json
  def destroy
    @admin_song.destroy
    respond_to do |format|
      format.html { redirect_to admin_songs_url, notice: 'Song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_song
      @admin_song = Admin::Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_song_params
      params.require(:admin_song).permit(:user_id, :name_song, :beats, :genre, :version, :name_artist, :date_upload)
    end
end
