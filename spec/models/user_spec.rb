require 'rails_helper'

describe User do
  it { should validate_presence_of :name }
  it { should validate_presence_of :provider }
  it { should validate_presence_of :uid }

  context ".find_or_create_using_omniauth" do
    it "returns nil when it receives an improperly formatted hash" do
      user = User.find_or_create_using_omniauth provider: "Zombo"
      expect(user).to be_nil
    end
  end
end
