require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe ".by_initial" do
    subject { Profile.by_initial("S") }

    let(:nathan) { create :profile, first_name: "Nathan" }
    let(:marcus) { create :profile, first_name: "Marcus" }
    let(:lara) { create :profile, first_name: "Lara" }

    it "returns the profiles that match the initial" do
      expect(subject).to eq([nathan, marcus])
    end
  end
end
