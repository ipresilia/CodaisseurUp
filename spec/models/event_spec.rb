require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "#available?" do
    let(:host_user) { create :user, email: "host@user.com" }
    let(:guest_user) { create :user, email: "guest@user.com" }

    let(:event) { create :event, price: 5, user: host_user }

    let!(:existent_rsvp) { create :rsvp, event: event, starts_at: 2.days.from_now, ends_at: 3.days.from_now, user: guest_user }

    context "is available" do
      subject { event.available?(8.days.from_now, 9.days.from_now) }

      it "returns true" do
        expect(subject).to be true
      end
    end

    context "is not available" do
      subject { event.available?(4.days.from_now, 5.days.from_now) }

      it "returns false" do
      end
    end
  end



  describe "validations" do
    # it "is invalid without a name" do
    #   event = Event.new(name: "")
    #   event.valid?
    #   expect(event.errors).to have_key(:name)
    # end
    #
    # it "is invalid without a description" do
    #   event = Event.new(description: nil)
    #   event.valid?
    #   expect(event.errors).to have_key(:description)
    # end
    #
    # it "is invalid with a description longer than 500 characters" do
    #   event = Event.new(description: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. ")
    #   event.valid?
    #   expect(event.errors).to have_key(:description)
    # end

    ###ABOVE CODE DOES NOT PASS RSPEC TEST
    # rspec spec/features/list_events_spec.rb


    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_length_of(:description).is_at_most(500) }
  end

    describe "#bargain?" do
      let(:bargain_event) { create :event, price: 0 }
      let(:non_bargain_event) { create :event, price: 5 }

      it "returns true if the price is smaller than 2 Euros" do
        expect(bargain_event.bargain?).to eq(true)
        expect(non_bargain_event?).to eq(false)
      end
    end

    describe ".order_by_price" do
      let!(:event1) { create :event, price: 2 }
      let!(:event2) { create :event, price: 5 }
      let!(:event3) { create :event, price: 0 }

      it "returns a sorted array of events by prices" do
        expect(Event.order_by_price).to eq([event3, event1, event2])
      end
    end

    describe "assosiation with rsvp" do
      let(:guest_user) { create :user, email: "guest@user.com" }
      let(:host_user) { create :user, email: "host@user.com" }

      let!(:event) { create :event, user: host_user }
      let!(:rsvp) { create :rsvp, event: event, user: guest_user }

        it "has guests" do
          expect(event.guests).to include(guest_user)
        end
      end


end
