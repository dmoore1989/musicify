class UsersController < ApplicationController

  def new
    @user = User.new

    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in_user!(@user)
      redirect_to users_url
    else
      flash[:errors] = @user.errors.full_messages
    end
  end

end
