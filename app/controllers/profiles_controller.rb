class ProfilesController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      results = phones_params.map { |p| @user.phones.create(p) }

      if results.all?
        redirect_to root_path, notice: "Saved user and all phones"
      else
        redirect_to root_path, error: "Failed to save some phones"
      end
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def phones_params
    params.require(:phones).map do |p|
      p.permit(:number, :description)
    end
  end
end
