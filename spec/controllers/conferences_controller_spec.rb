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
end
