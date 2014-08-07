require 'rails_helper'

describe CallsController do
  context "#new" do
    let(:conference) { FactoryGirl.create :conference }

    it "renders the calls new template" do
      get :new, conference_id: conference.id
      expect(response).to render_template(:new)
    end
  end
end
