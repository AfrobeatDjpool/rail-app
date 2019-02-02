class Api::V1::SongsController < Api::V1::ApiController
	# skip_before_action  :verify_authenticity_token 
  # before_action :authenticate_user!, only: [:destroy]
  # before_action :authenticate_user!
	
  eval(IO.read('doc/api_doc/songs/index.html'), binding)
 
  def index
    @songs = Song.all
    render json: {status: 200, data: { :songs => @songs.as_json}, :message =>"Successfuly Show Song"}
  end

  eval(IO.read('doc/api_doc/songs/mysong.html'), binding)
  
  def mysongs
    @songs = current_user.songs
    render json: {status: 200, data: { :songs => @songs.as_json}, :message =>"Your Song"}
  end

  # GET /songs/1
  # GET /songs/1.json

  eval(IO.read('doc/api_doc/songs/show.html'), binding)
  
  def show
    @song = Song.find(params[:id])
    name_song = @song.name_song
    name_artist = @song.name_artist
    date_uploaded = @song.date_uploaded
    artist_upload_song = @song.user.first_name
    render json: {status: 200, data: {:name_song => name_song, :name_artist => name_artist, :date_uploaded => date_uploaded, :artist_upload_song => artist_upload_song}, :message =>"Show Song Details"}
    # render json: {status: 200, data: { :songs => @song.as_json, :name_song => name_song, :name_artist => name_artist, :date_uploaded => date_uploaded, :artist_upload_song => artist_upload_song}, :message =>"Show Song Details"}
  end

  def download_section
    @songs = current_user.songs
    @song = @songs.find_by(params[:id])
    name_song = @song.name_song
    name_artist = @song.name_artist
    date_uploaded = @song.date_uploaded
    render json: {status: 200, data: { :songs => @songs.as_json, :name_song => name_song, :name_artist => name_artist, :date_uploaded => date_uploaded}, :message =>"Download Song"}
  end

  eval(IO.read('doc/api_doc/songs/delete.html'), binding)

  def destroy
    @song = Song.find(params[:id])
    if @song.destroy
      render :json =>{ status: 200, location: @song, :message=>"successfully deleted song" }
    else
       render :json=> @song.errors.full_messages, :status=>401
    end
  end

  def edit
  end  

  # GET /songs/new
  def new
    @song = Song.new
  end

  eval(IO.read('doc/api_doc/songs/create.html'), binding) 

  def create
    if current_user.role == "admin"
      user = current_user.first_name
      song = current_user.songs.new(admin_song_params)
      # song.user_id = current_user.try(:id)
       if song.save
     
        return render json: {status: 200, data: {song: song, user: user}, :message =>"Successfuly Create Song"} 
      else
        warden.custom_failure!
        return render json: {status: 401, data: {song: nil, errors: song.errors}, :message =>"Song Rollback"} 
      end
    else
      return render json: {status: 401,  :message =>"You are Not Admin"}
    end  
  end

  eval(IO.read('doc/api_doc/songs/update.html'), binding)

  def update
    @song = Song.find(params[:id])
    @song.update(admin_song_params)
      if @song.save 
       render :json =>{ status: 200, data: {location: @song}, :message => "Succssfuly Updated Song" }
      else
         render :json=> @song.errors.full_messages, :status=>401
      end
  end

  

  private
	  def set_admin_song
	    @admin_song = Admin::Song.find(params[:id])
	  end

	    # Never trust parameters from the scary internet, only allow the white list through.
	    def admin_song_params
	      params.require(:admin_song).permit(:user_id, :name_song, :beats, :genre, :version, :name_artist, :date_upload)
	    end
  

end
