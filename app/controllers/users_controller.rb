class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create

    @user = User.new params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    if @user.save
      sign_in @user
      redirect_to root_path, notice: "Welcome to MyProduct, #{@user.first_name}"
    else
      render :new
    end
  end
end
