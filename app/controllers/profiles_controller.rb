class ProfilesController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      @phone1 = @user.phones.new phone1_params
      if @phone1.save
        redirect_to root_path, notice: "Saved user and phones"
      else
        render :new
      end
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def phone1_params
    params.require(:phone1).permit(:number, :description)
  end
end
