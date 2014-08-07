describe Conference do
  let(:conference) { Conference.create  name: "GoGaGaGaGa: The Spoon Conf",
                                        location: "Seattle, WA",
                                        code_of_conduct: true,
                                        childcare: true
  }

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

  it "has many topics"
  it "has many talk lengths"
end