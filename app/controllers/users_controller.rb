class UsersController < ApplicationController
  def new
  end

  def create
      @user = User.new(user_params)
    if @user.save
      UserMailer.welcome_email(@user).deliver_now
      session[:user_id] = @user.id
      redirect_to '/'
  else
      redirect_to 'users/signup'
  end
  end

  def show
    @user = current_user
  end


  def user_params
   params.require(:user).permit(:first_name, :last_name, :company, :contractor_number, :phone_number, :email, :password, :password_confirmation)
  end


end
