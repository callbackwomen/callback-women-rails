class SessionsController < ApplicationController
  def create
    user = User.find_or_create_using_omniauth env["omniauth.auth"]
    session[:user_id] = user.id
    redirect_to root_url, notice: "Signed in."
  end
end