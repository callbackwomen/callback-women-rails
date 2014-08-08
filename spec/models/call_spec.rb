require 'rails_helper'

describe Call do
  let(:conference) { FactoryGirl.create :conference }
  let(:call) { FactoryGirl.create :call }

  it "has a due date" do
    expect(call.due_date.month).to eq 7
  end

  it { should belong_to :conference }
  it { should validate_presence_of :conference }
end
