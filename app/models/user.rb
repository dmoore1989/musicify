class User < ActiveRecord::Base
  after_initialize :generate_session_token
  validates :email, :password_digest, :session_token, presence: true
  validates :email, uniqueness: true

  def generate_session_token
    self.session_token = SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    session[:token] = self.session_token
  end

  def ensure_session_token
    unless session_token == self.session_token
      flash[:errors] = ["User not logged in"]
      redirect_to users_url
    end
  end
end
