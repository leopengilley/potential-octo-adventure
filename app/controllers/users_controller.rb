class UsersController < ApplicationController
  before_action :check_for_admin, :only => [:index]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.create user_params
    #checking for existing username (maybe the message can be instant?)
    if name.includes? params[:user][:name]
      return
    end

    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @current_user
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
