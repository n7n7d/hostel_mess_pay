class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update,:show]
  before_action :correct_user,   only: [:edit, :update]
  def new
    if logged_in?
      flash[:info] = "Please logout for Registering other user !"
      redirect_to @current_user
    else
    @user = User.new
    end
  end

  def show
    @user = User.find(params[:id])
    if @user == current_user
      @user = User.find(params[:id])
    else
      flash[:info] = "You dont have access"
      redirect_to @current_user
    end
  end

  def create
    resident = Resident.find_by(roll_number: user_params[:roll_number])
    if resident.present?
      @user = resident.create_user(user_params)
      if @user.save
        @user.send_activation_email
        UserMailer.account_activation(@user).deliver_now
        flash[:info] = "Please check your email to activate your account."
        redirect_to root_url
      else
        render 'new'
      end
    else
      flash[:danger] = "You have entered a worng Roll number or you are not a Resident"
      redirect_to signup_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
      flash[:success] = "Password changed !"
      redirect_to @user

    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:roll_number, :email, :password,
                                 :password_confirmation)
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
