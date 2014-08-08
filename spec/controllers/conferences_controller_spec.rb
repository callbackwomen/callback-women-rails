require 'rails_helper'

describe ConferencesController do
  let!(:conference)  { Conference.create  name: "GoGaGaGaGa: The Spoon Conf",
                                        location: "Seattle, WA",
                                        code_of_conduct: true,
                                        childcare: true
  }

  context "#index" do
    it "renders the conferences index" do
      get :index
      expect(response).to render_template(:index)
    end

    it "returns conferences" do
      get :index
      expect(assigns(:conferences)).to include(Conference.first)
    end
  end

  context "#new" do
    it "shows the form for a new conference" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  context "#create" do
    it "processes requests with correct params" do
      post :create, name: "Foo Conf",
                    location: "UK",
                    code_of_conduct: true,
                    childcare: false,
                    last_years_attendance: 97
      expect(response.status).to eq 302 # Redirect
    end
  end
end
