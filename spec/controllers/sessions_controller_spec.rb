require 'rails_helper'

describe SessionsController do
  before do
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
  end

  context "#create" do
    it "creates a session for a user" do
      post :create, provider: :twitter
      expect(session[:user_id]).to be_present
    end
  end

  context "#destroy" do
    it "destroys a session for a user"
  end
end
