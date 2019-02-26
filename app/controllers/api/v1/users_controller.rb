class Api::V1::UsersController < Api::V1::ApiController
    # before_action :authenticate_user!

	eval(IO.read('doc/api_doc/users/index.html'), binding)

	def index
    @users = User.all
    @users = @users.paginate(:page => params[:page], :per_page => 10)
     
     render json: {status: 200, data: { :users => @users.as_json}, :message =>"Successfuly Listed Users"}
  end


end
