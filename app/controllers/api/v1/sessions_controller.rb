class Api::V1::SessionsController < Api::V1::ApiController
  # skip_before_action  :verify_authenticity_token 
  # before_action :authenticate_user!, only: [:destroy]
  before_action :authenticate_user!, except: [:create, :facebook_login, :twitter]
  # ====================Sign IN====================================
    require 'base64'

    eval(IO.read('doc/api_doc/auth/sign_in.html'), binding) 

  def create
    # begin
 
      email = params[:user][:email]
      password = params[:user][:password]
      return render json:{data: {user: nil}, message: "The request must contain the email and password."},status: 401 unless email && password
      @user = User.where(email: email).first
      return render json:{data: {user: nil}, message: "Invalid email or password"},status: 401 if @user.blank?
      return render json:{data: {user: nil},  message: "Invalid email or password"},status: 401 if not @user.valid_password?(password)
      sign_in @user
     
      # @user = @user.as_json(only: [:id,:email, :email,:name,:address,:role,:authentication_token, :image, :created_at])
      return render json: {user: @user, message: "Login Successful"},status: 200
    # rescue
    #   rescue_section
    # end
  end
  
   eval(IO.read('doc/api_doc/auth/facebook_login.html'), binding)
   eval(IO.read('doc/api_doc/auth/twitter_login.html'), binding)
   eval(IO.read('doc/api_doc/auth/google_login.html'), binding)

  # def facebook_login 
  #   byebug 
  #   # return render json: {status:401, message: "Provider required"} if params[:provider].blank?
  #   # return render json: {status:401, message: "OAuth access token required"} if params[:token].blank?
  #   # return render json: {status:401, message: "Provider Not Available"} unless params[:provider] == "facebook" || params[:provider] == "twitter" || params[:provider] == "linkedin" || params[:provider] == "google"
  

  #   user = Authentication.from_omniauth(params[:user][:response])
  #     if user
  #       return render json: {user: user, message: "Login Successful"},status: 200

  #     else
  #       render :json=> user.errors.full_messages, status: 401
  #     end 
  # end

  def facebook_login

    # byebug
   user = Authentication.from_omniauth(params[:user])
   if user.errors.empty?
      sign_in("user", user)

      return render json: {user: user, message: "Login Successful"},status: 200
    else
      render :json=> user.errors.full_messages, :status=>401
    end
  end

  def twitter
    # byebug
   user = Authentication.from_omniauth(params[:user])
   if user.errors.empty?
      sign_in("user", user)

      return render json: {user: user, message: "Login Successful"},status: 200
    else
      render :json=> user.errors.full_messages, :status=>401
    end
  end


  def react_social_login
    user = Authentication.react_create_account(params)
      if user
        render json: {:status => 200, :user=>user.as_json().merge(
    
            authentication: user.authentications,
          ), :message =>"Login Successful"}
      else
        render :json=> user.errors.full_messages, :status=>401
      end 
  end


  def destroy
  end
end
