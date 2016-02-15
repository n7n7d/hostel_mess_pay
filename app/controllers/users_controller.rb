class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Handle a successful save.
      flash[:success] = "Welcome to Messpay:Now pay mess bills online easily"
      redirect_to @user

    else
      render 'new'
    end
  end
  def user_params
    params.require(:user).permit(:roll_number, :email, :password,
                                 :password_confirmation)
  end
end
