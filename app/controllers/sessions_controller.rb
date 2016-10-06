class SessionsController < ApplicationController
  def new
    @user = User.new
  end
  def create
    user_params = params.require(:user).permit(:email, :password)
    @user = User.confirm(user_params)
    if @user
      login(@user)
      redirect_to @user
      flash[:login_success] = "Logged in with no issue! :)"
    else
      flash[:login_error] = "Wrong Email/Password Combination"
      redirect_to login_path
    end
  end
  def destroy
    logout()
    redirect_to root_path
    flash[:logout_success] = "Logged out, no problems."
  end
end
