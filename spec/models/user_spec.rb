require 'rails_helper'

describe User do
  it { should validate_presence_of :name }
  it { should validate_presence_of :provider }
  it { should validate_presence_of :uid }

  context ".find_or_create_using_omniauth" do
    context "returns a user when it receives a properly formatted hash" do
      let(:brennas_params) { {  info:     { name: "Brenna Dobbs" },
                                provider: "Vooza",
                                uid:      "1234567890" } }

      let(:annas_params) { {  info:     { name: "Anna Smith" },
                              provider: "Vooza",
                              uid:      "1234567891" } }

      context "creates a new user" do
        it "should increase the User count by 1" do
          expect {
            User.find_or_create_using_omniauth brennas_params
          }.to change{User.count}.by 1
        end
      end

      context "finds an existing user" do
        it "does not increase the User count" do
          User.create name:     annas_params[:info][:name],
                      provider: annas_params[:provider],
                      uid:      annas_params[:uid]

          expect {
            User.find_or_create_using_omniauth annas_params
          }.to change{User.count}.by 0
        end
      end
    end

    it "returns nil when it receives an improperly formatted hash" do
      user = User.find_or_create_using_omniauth provider: "Zombo"
      expect(user).to be_nil
    end
  end
end
