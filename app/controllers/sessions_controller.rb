class SessionsController < ApplicationController
  def new
    @user = User.new

    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])

    if @user
      log_in!(@user)
      redirect_to bands_url
    else
      flash[:erorrs] = ["Invalid username or password"]
      redirect_to new_session_url
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:token] = nil
    redirect_to new_session_url
  end

end
