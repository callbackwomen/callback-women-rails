require 'rails_helper'

describe Conference do
  let(:conference) { FactoryGirl.create :conference }
  let(:other_conference) { FactoryGirl.create :conference,
                                              name: "TrololololConf",
                                              location: "Oakland, CA" }
  let!(:cfp) { FactoryGirl.create :call, conference: conference }

  context "current call for proposals" do
    it "has a current call for proposals for conferences with cfps" do
      expect(conference.current_call).to eq cfp.due_date
    end

    it "indicates there is no cfp yet for conferences without calls" do
      expect(other_conference.current_call).to eq false
    end
  end

  it "has a name" do
    expect(conference.name).to eq "GoGaGaGaGa: The Spoon Conf"
  end
  it { should validate_presence_of :name }

  it "has a location" do
    expect(conference.location).to eq "Seattle, WA"
  end
  it { should validate_presence_of :location }

  it "may have a code of conduct" do
    # TODO write a case for default
    expect(conference.code_of_conduct?).to be true
  end

  it "may have childcare" do
    # TODO write a case for default
    expect(conference.childcare?).to be true
  end

  it "may have last year's attendance" do
    # TODO write a case for non-default
    expect(conference.last_years_attendance).to eq 0
  end

  it "has many topics" do
    expect(conference.topics.map(&:name)).to include "ruby"
  end
  it "has many talk lengths"
end