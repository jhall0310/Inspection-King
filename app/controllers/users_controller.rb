class UsersController < ApplicationController
  def new
  end

  def create
      @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You have successfully created your account."
      UserMailer.welcome_email(@user).deliver_now
      session[:user_id] = @user.id
      redirect_to '/'
  else
      flash[:notice] = @user.errors.full_messages.join(", ")
      redirect_to '/'
  end
  end

  def show
    @user = current_user
  end

  def edit
    user_id = current_user.id
    @user = User.find_by_id(user_id)
  end

  def update
    user_id = current_user.id
    user = User.find_by_id(user_id)

    user.update_attributes(user_params)
    if user.update_attributes(user_params)
    flash[:notice] = "You have successfully updated your account."
    redirect_to user_path(current_user)
  end
end


  def user_params
   params.require(:user).permit(:first_name, :last_name, :company, :contractor_number, :phone_number, :email, :password, :password_confirmation)
  end


end
