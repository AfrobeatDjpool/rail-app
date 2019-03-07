class Api::V1::RegistrationsController < Api::V1::ApiController
  # skip_before_action  :verify_authenticity_token 
  #  skip_before_action :authenticate_user!, only: [:create, :resset_password]
   eval(IO.read('doc/api_doc/auth/sign_up.html'), binding)
	def create
    if params[:registration].present? && params[:user].present?
      user = User.new(:email=>params[:user][:email],:first_name=>params[:user][:first_name], :second_name=>params[:user][:second_name], :password=>params[:user][:password], :password_confirmation=>params[:user][:password_confirmation])
    else
      user = User.new(registration_params)
    end

    if user.save
   
      # user = user.as_json(only: [:id,:email, :first_name,:name,:address,:role,:authentication_token, :image, :created_at])
      return render json: {data: {user: user},status: 200,  :message =>"Successfuly Signup"} 
    else
      warden.custom_failure!
      return render json: {data: {user: nil, errors: user.errors},status: 401,  :message =>"SignUp Rollback"} 
    end
  end
  
    eval(IO.read('doc/api_doc/auth/forget_password.html'), binding)
  def reset_password

    if params[:email].nil?
          render :status=>400,
          :json=>{:message=>"The request must contain the user email "}
          return
    end
    @user = User.find_by_email(params[:email])

    if @user.present?
      @user.send_reset_password_instructions
      render :status=>200, :json=>{:status => true,:message=>'New Password has been sent on your email'
            }
    else
        render :status=>401, :json=>["mail not exist"]
    end
  end

  eval(IO.read('doc/api_doc/auth/profile.html'), binding)

  def profile
    @user = User.find(params[:id])
    render json: {status: 200, data: { :user => @user.as_json}, :message =>"Show User Details"}
 

    # begin
      # if current_user.role == "admin"
      #   user = user.present? ? user : current_user,
      #   email = user.present? ? email : current_user.email,
      #   first_name = user.present? ? first_name : current_user.first_name,
      #   second_name = user.present? ? second_name : current_user.second_name,
      #   name_label = user.present? ? name_label : current_user.name_label,
      #   country = user.present? ? country : current_user.country
      #   return render json: {status: 200, data: {email: email, first_name: first_name, second_name: second_name, name_label: name_label, country: country}, :message =>"User Profile"}
      
      # elsif current_user.role == "user"
      #   user = user.present? ? user : current_user,
      #   email = user.present? ? email : current_user.email,
      #   first_name = user.present? ? first_name : current_user.first_name,
      #   second_name = user.present? ? second_name : current_user.second_name,
      #   state = user.present? ? state : current_user.state,
      #   facebook_url = user.present? ? facebook_url : current_user.facebook_url,
      #   twitter_url = user.present? ? twitter_url : current_user.twitter_url,
      #   instagram_url = user.present? ? instagram_url : current_user.instagram_url,
      #   country = user.present? ? country : current_user.country,
      #   name_club = user.present? ? name_club : current_user.name_club

      #   return render json: {status: 200, data: {email: email,first_name: first_name, second_name: second_name, state: state, facebook_url: facebook_url, twitter_url: twitter_url, instagram_url: instagram_url,  country: country, name_club: name_club  }, :message =>"User Profile"}
      # end  
    # rescue
    #   rescue_section
    # end   
  end

  

  # def update
  #   begin
  #      user =  current_user
  #      user.first_name = params[:first_name] if params[:first_name].present?
  #      user.email = params[:email] if params[:email].present?
  #      user.password = params[:password] if params[:password].present?
  #      user.second_name = params[:second_name] if params[:second_name].present?
  #      user.role = params[:role] if params[:role].present?
  #      if user.save
  #       return render json: {status: 200, data: {user: user}, :message =>"User Profile Successfully Updated"} 
  #     else
  #       # error_section
  #       rescue_section
  #     end
  #   rescue
  #     rescue_section
  #   end
  # end 
  eval(IO.read('doc/api_doc/auth/edit_profile.html'), binding)

  def update_account
    @user = User.find(params[:id])
    @user.update(registration_params)
      if @user.save 
       render :json =>{ status: 200, data: {location: @user}, :message => "Succssfuly Updated User" }
      else
         render :json=> @user.errors.full_messages, :status=>401
      end
  end

  def edit
    @user = User.find(params[:id])
    render json: {status: 200, data: { :user => @user.as_json}, :message =>"Show User Details"}
    
  end 

  
  
   private
  
    def registration_params
      params.require(:registration).permit(:email, :first_name, :second_name, :name_label, :country, :state, :facebook_url, :instagram_url, :twitter_url, :name_club, :role, :password, :password_confirmation, :city, :zip_code, :role, :status)
    end
end
