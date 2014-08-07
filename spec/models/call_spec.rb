require 'rails_helper'

describe Call do
  let(:conference) { Conference.create name: "GoGaGaGaGa: The Spoon Conf" }
  let(:call) { Call.create due_date: "2015/07/04" }

  it "has a due date" do
    expect(call.due_date.month).to be 7
  end

  it { should belong_to :conference }
end
