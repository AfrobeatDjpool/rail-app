ActiveAdmin.register User do
  remove_filter :reset_password_token
  permit_params :email, :first_name, :second_name, :password, :facebook_url, :instagram_url, :twitter_url, :name_label, :country, :state, :role, :city, :name_club
	
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end



  index do
    # id_column
    column "User" do |m|
   		usr = User.find(m.id).first_name
 	end
    
    column :email
    column :first_name
    column :second_name
    column :name_label
    column :facebook_url
    column :instagram_url
    column :twitter_url
    column :name_club
    column :country
    column :state
    # column :role
    column "role" do |m|
   		usr = User.find(m.id).role
 	end
    column :city
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table :email, :first_name, :second_name, :name_label, :facebook_url, :instagram_url, :twitter_url, :name_club,  :country, :state, :role, :city
  end

	form do |f|
    f.inputs "user Details" do
      f.input :email
      f.input :password      
      f.input :first_name
      f.input :second_name
      f.input :name_label
      # f.input :date_of_birth, start_year: Date.today.year - 100

      #f.input :gender
      #f.input :gender, sellect: ["Male", "Female"]
      # f.input :gender, as: :select, collection: User::GENDER.invert, include_blank: false

      f.input :facebook_url
      f.input :instagram_url
      f.input :twitter_url
      f.input :name_club
      f.input :country
      f.input :state
      f.input :city
      f.input :role, as: :select, collection: User::ROLE.invert, include_blank: false
      
    end
    f.actions
  end

end

