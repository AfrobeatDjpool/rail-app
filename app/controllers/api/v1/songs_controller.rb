class Api::V1::SongsController < Api::V1::ApiController
  # skip_before_action  :verify_authenticity_token 
  # before_action :authenticate_user!, only: [:destroy]
  # before_action :authenticate_user!
  
  eval(IO.read('doc/api_doc/songs/create.html'), binding) 

  # def create
  #   # byebug
  #   # if current_user.role == "admin"
  #     # user = current_user.first_name
  #     # song = current_user.new(admin_song_params)
  #     song = Song.new(name_song: params[:song][:name_song], user_id: params[:song][:user_id])
  #     # song.user_id = current_user.try(:id)
  #      if song.save
     
  #       return render json: {status: 200, data: {song: song, user: user}, :message =>"Successfuly Create Song"} 
  #     else
  #       warden.custom_failure!
  #       return render json: {status: 401, data: {song: nil, errors: song.errors}, :message =>"Song Rollback"} 
  #     end
  #   # else
  #   #    return render json: {status: 401,  :message =>"You are Not Admin"}
  #   # end  
  # end
  def uplaod_audio
    @audio = SongAudio.new(name: params[:file])
    @audio.save
    # render :json { audio_id: @audio.id, status: 200}
    return render json: {status: 200, data: {audio: @audio}, :message =>"Successfuly Create Uploaded"} 
  end

  def create
    # if current_user.role == "admin"
      # user = current_user.first_name
      # song = current_user.new(admin_song_params)
      song = Song.new(name_song: params[:song][:name_song], image: params[:image], user_id: params[:song][:user_id], beats: params[:song][:beats], genre: params[:song][:genre], version: params[:song][:version], name_artist: params[:song][:name_artist], date_uploaded: params[:song][:date_uploaded])
      # song.user_id = current_user.try(:id)
      @audio = SongAudio.find(params[:image])
       if song.save
        @audio.update(song_id: song.id)
        return render json: {status: 200, data: {song: song, audio: @audio}, :message =>"Successfuly Create Song"} 
      else
        warden.custom_failure!
        return render json: {status: 401, data: {song: nil, errors: song.errors}, :message =>"Song Rollback"} 
      end
    # else
    #    return render json: {status: 401,  :message =>"You are Not Admin"}
    # end  
  end

  eval(IO.read('doc/api_doc/songs/index.html'), binding)
 
  def index
    songs = Song.all
    render json: {status: 200, data: { :songs => songs.as_json}, :message =>"Successfuly Show Song"}
    # @songs = Song.order("created_at DESC")
    # render json: @songs
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
    # byebug
    @song = Song.find(params[:id])
    @name = @song.name_song
    # name_artist = @song.name_artist
    # date_uploaded = @song.date_uploaded
    # artist_upload_song = @song.user.first_name
    # render json: {status: 200, data: {:name_song => name_song, :name_artist => name_artist, :date_uploaded => date_uploaded, :artist_upload_song => artist_upload_song}, :message =>"Show Song Details"}
    render json: {status: 200, data: { :song => @song.as_json, :name => @name.as_json}, :message =>"Show Song Details"}
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
    @song = Song.find(params[:id])
    render json: {status: 200, data: { :song => @song.as_json, :name => @name.as_json}, :message =>"Song Details"}


  end  

  # GET /songs/new
  def new
    @song = Song.new
  end

  

  eval(IO.read('doc/api_doc/songs/update.html'), binding)

  def update
    byebug
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
        params.require(:admin_song).permit(:user_id, :name_song, :beats, :genre, :version, :name_artist, :image, :date_uploaded)
      end
  

end
