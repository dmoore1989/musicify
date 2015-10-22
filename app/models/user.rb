class User < ActiveRecord::Base
  vallidates :email, :password_digest, :session_token, presence: true
  vallidates :email, uniqueness: true 
