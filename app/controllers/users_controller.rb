class UsersController < ApplicationController
  before_action :authenticate_user!
  # before_action :authenticate_user!, except: [:create, :facebook_login]
  def index
  	@users = User.all.paginate(:page => params[:page], :per_page => 30)
  end
  

  def profile
  
 	  @user = User.find(params[:id])
    
    if current_user.role == "admin"
      user = user.present? ? user : current_user,
      email = user.present? ? email : current_user.email,
      first_name = user.present? ? first_name : current_user.first_name,
      second_name = user.present? ? second_name : current_user.second_name,
      name_label = user.present? ? name_label : current_user.name_label,
      country = user.present? ? country : current_user.country
      # return render json: {status: 200, data: {email: email, first_name: first_name, second_name: second_name, name_label: name_label, country: country}, :message =>"User Profile"}
    
    elsif current_user.role == "user"
      user = user.present? ? user : current_user,
      email = user.present? ? email : current_user.email,
      first_name = user.present? ? first_name : current_user.first_name,
      second_name = user.present? ? second_name : current_user.second_name,
      state = user.present? ? state : current_user.state,
      facebook_url = user.present? ? facebook_url : current_user.facebook_url,
      twitter_url = user.present? ? twitter_url : current_user.twitter_url,
      instagram_url = user.present? ? instagram_url : current_user.instagram_url,
      country = user.present? ? country : current_user.country,
      name_club = user.present? ? name_club : current_user.name_club

      # return render json: {status: 200, data: {email: email,first_name: first_name, second_name: second_name, state: state, facebook_url: facebook_url, twitter_url: twitter_url, instagram_url: instagram_url,  country: country, name_club: name_club  }, :message =>"User Profile"}
    end  
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    flash[:success] = "Profile Successfully Updated"
  end
  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :second_name, :name_label, :country, :state, :facebook_url, :instagram_url, :twitter_url, :name_club, :city, :email, :password, :password_confirmation, :role)
  end

end