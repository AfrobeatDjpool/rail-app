class Admin::UsersController < ApplicationController
  before_action :check_if_admin, only: [:destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
 
    if @user.save
      flash[:success] = "User #{user_params[:first_name]} has created!"
      # MailerWorker.perform_async(@user.id)
      # UserMailer.welcome_email(@user).deliver

      redirect_to '/admin/users'
    else
      flash[:error] = "One or more required fields are missing"
      render "new"
    end
  end

  def show
    @user = User.find_by(id: params[:id])
   
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile Successfully Updated"
      redirect_to '/admin/users'
    else
      render "edit"
    end
  end

  def upload_image(text)
    @upload = {}
    @upload[:avatar] = Cloudinary::Uploader.upload(text)
    @avatar_url = @upload[:avatar]["url"]
  end

  def destroy
    user = User.find(params[:id])
    if user
      user.destroy
      flash[:success] = "#{user.first_name} has been deleted."
      redirect_to '/admin/users'
    else
      flash[:error] = "An error occured. Try deleting #{@user.first_name} again."
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :second_name, :country, :state, :city, :email, :password, :password_confirmation, :avatar, :role)
  end

  def args_params
    args = params.require(:args).permit(:show_all, :title) if params.has_key? "args"
  end

  def uploader_checker(image)
    if image.size < 1.megabytes
      upload_image(image)
    else
      flash[:warning] = "file size must be between 0 and 1 megabytes"
    end
  end
end
