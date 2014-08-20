class SessionsController < ApplicationController
  def create
    # User.find_or_create_using env["omniauth.auth"]
  end
end