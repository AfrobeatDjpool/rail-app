class ApplicationController < ActionController::Base
    # before_action :authenticate_user!
	before_action :configure_permitted_parameters, if: :devise_controller?
	layout :determine_layout
	protected

	def configure_permitted_parameters

  	devise_parameter_sanitizer.permit(:sign_up) do |user_params|
	    user_params.permit({ roles: [] }, :email, :first_name, :second_name, :password, :password_confirmation)
	  end

	   	devise_parameter_sanitizer.permit(:account_update) do |user_params|
	   		 user_params.permit({ roles: [] }, :email, :password, :first_name, :second_name, :password_confirmation,:current_password)
	  end
  end

  private
	  def determine_layout
	  	if params[:controller] =="homes"  ||  params[:controller] =="devise/sessions" || params[:controller] =="devise/registrations" 
		    "new_layout"
		  else
		  	"application"
		  end
	  end

end
