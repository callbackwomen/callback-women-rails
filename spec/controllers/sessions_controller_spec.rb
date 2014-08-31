require 'rails_helper'

describe SessionsController do
  before do
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
  end

  context "#create" do
    context "Creating a new user" do
      let(:post_create) { post :create, provider: :twitter }

      it "creates a new user" do
        expect { post_create }.to change { User.count }.by(1)
      end

      it "creates a session for the new user" do
        post_create
        expect(session[:user_id]).to be_present
      end
    end

    context "Creating an existing user" do
      before do
        # Mock the env to match that of the User Factory.
        request.env['omniauth.auth'] = {  info: { name: "Tracy"},
                                          uid: "123789",
                                          provider: "twitter" }
      end

      let!(:user)  { FactoryGirl.create :user }
      let(:post_create) { post :create, provider: :twitter }

      it "finds an existing user" do
        expect { post_create }.to_not change { User.count }
      end

      it "creates a session for the existing user" do
        post_create
        expect(session[:user_id]).to eq User.find_by(uid: "123789").id
      end
    end
  end

  context "#destroy" do
    let!(:post_create) { post :create, provider: :twitter }

    it "should clear the session" do
      expect(session[:user_id]).to_not be_nil
      delete :destroy
      expect(session[:user_id]).to be_nil
    end

    it "should redirect to the home page" do
      delete :destroy
      expect(response).to redirect_to root_url
    end
  end
end
