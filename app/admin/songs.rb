ActiveAdmin.register Song do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :user_id, :name_song, :beats, :genre, :version, :name_artist, :date_uploaded

#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

	index do
    id_column
    
    # column :user_id
    column "User" do |m|
   		usr = User.find(m.user_id).first_name
 		 end
    column :name_song
    column :beats
    column :genre
    column :version
    column :name_artist
    column :date_uploaded
    column :created_at
    column :updated_at
     column "SongAudio" do |m|
      audio = SongAudio.find_by(song_id: m).name
     end
    actions
  end

  show do
    attributes_table :user_id, :name_song, :beats, :genre, :version, :name_artist, :date_uploaded
  end

	 form do |f|
    f.inputs "song Details" do
    	f.input :user_id, :label => 'User', :as => :select, :collection => User.all.map{|u| ["#{u.first_name}", u.id]}
      f.input :name_song
      f.input :beats      
      f.input :genre
      f.input :version
      f.input :name_artist
      f.input :date_uploaded, start_year: Date.today.year - 100

      
    end
    f.actions
  end
	# form do |f|
	#     f.inputs "user Details" do
	#       f.input :email
	#     end
	#     f.actions
	# end
end
