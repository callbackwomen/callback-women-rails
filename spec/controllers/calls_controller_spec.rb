require 'rails_helper'

describe CallsController do
  let(:conference) { FactoryGirl.create :conference }

  context "#new" do
    it "renders the calls new template" do
      get :new, conference_id: conference.id
      expect(response).to render_template(:new)
    end
  end

  context "#create" do
    it "processes requests with correct params" do
      post :create, { conference_id: conference.id,
                      call: { due_date: "2015-01-06" } }
      expect(response).to redirect_to conference_path(conference)
    end
  end
end
