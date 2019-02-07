class Api::V1::SessionsController < Api::V1::ApiController
  # skip_before_action  :verify_authenticity_token 
  # before_action :authenticate_user!, only: [:destroy]
  before_action :authenticate_user!, except: [:create, :facebook_login]
  # ====================Sign IN====================================
    require 'base64'

    eval(IO.read('doc/api_doc/auth/sign_in.html'), binding) 

  def create
    begin
      return render json: {status: 401, data: {user: nil}, message: "Request Parameter not valid"} unless params[:user]
      email = params[:user][:email]
      password = params[:user][:password]
      return render json: {status: 401, data: {user: nil}, message: "The request must contain the email and password."} unless email && password
      @user = User.where(email: email).first
      return render json: {status: 401, data: {user: nil}, message: "Invalid email or password"} if @user.blank?
      return render json: {status: 401, data: {user: nil}, message: "Invalid email or password"} if not @user.valid_password?(password)
      return render json: {status: 200, data: {user: current_user}, message: "You have allready Login."} if current_user
      sign_in @user
     
      # @user = @user.as_json(only: [:id,:email, :email,:name,:address,:role,:authentication_token, :image, :created_at])
      return render json: {status: 200, data: {user: @user}, message: "Login Successful"}
    rescue
      rescue_section
    end
  end
  
   eval(IO.read('doc/api_doc/auth/facebook_login.html'), binding)
   eval(IO.read('doc/api_doc/auth/twitter_login.html'), binding)
   eval(IO.read('doc/api_doc/auth/google_login.html'), binding)

  def facebook_login  
    return render json: {status:401, message: "Provider required"} if params[:provider].blank?
    return render json: {status:401, message: "OAuth access token required"} if params[:token].blank?
    return render json: {status:401, message: "Provider Not Available"} unless params[:provider] == "facebook" || params[:provider] == "twitter" || params[:provider] == "linkedin" || params[:provider] == "google"
      # url = 'https://graph.facebook.com/v2.7/me'

    user = Authentication.from_omniauth(params)
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
