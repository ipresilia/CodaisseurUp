class Rsvp < ApplicationRecord
  belongs_to :user
  belongs_to :event

  # def set_total_price
  #   self.price = event.price
  #   total_days = (ends_at.to_date - starts_at.to_date).to_i
  #   self.total = price * total_days
  # end

  before_save :set_price

  def set_price
    price = self.event.price
  end


  def event_available?
    event.available? starts_at. ends_at
  end 

end
