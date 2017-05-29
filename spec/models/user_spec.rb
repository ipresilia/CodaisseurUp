require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "association with rsvp" do
    let(:guest_user) { create :user, email: "guest@user.com" }
    let(:host_user) { create :user, email: "host@user.com" }

    let!(:event) { create :event, user: host_user }
    let!(:rsvp) { create :rsvp, event: event, user: guest_user }

    it "has rsvps" do
      expect(guest_user.rsvped_events).to include(event)
    end
  end
end
