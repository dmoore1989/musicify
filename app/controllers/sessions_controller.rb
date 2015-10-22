class SessionsController < ApplicationController
  def new
    @user = User.new

    render :new
  end

  def create
    @user = User.find_by_credentials

    if @user
      log_in_user!(@user)
    else
      flash[:erorrs] = @user.errors.full_messages
      redirect_to new_session_url
    end
  end

  def destroy
    current_user.reset_session_token
    session[:token] = nil
    redirect_to new_session_url
  end

end
