class SessionsController < ApplicationController
	# skip_before_filter  :verify_authenticity_token 
	# before_action :skip_authenticity_token
	 # skip_before_action :authenticate_user!
	 

  def create 
    user = Authentication.from_omniauth(request.env["omniauth.auth"])         

    if user
      flash[:notice] = "Authentication successful."
      sign_in(user)
      sign_in_and_redirect(user)
    else
        flash[:notice] = "Authentication Failed."
        redirect_to "/users/sign_in"
    end
  end

  def destroy
    current_user.update_attribute(:last_sign_out_at, Time.now)
    super
  end

end 