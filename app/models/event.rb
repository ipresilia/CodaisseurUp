class Event < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :themes

  validates :description, presence: true, length: { maximum: 500 }
  validates :name, :starts_at, :ends_at, presence: true
  # validates :ends_at, presence: true #, #date: {after: :start_date}


#  validates_presence_of :start_date, :end_date
#
# validate :end_date_is_after_start_date
#
#
# #######
# private
# #######
#
# def end_date_is_after_start_date
#   return if end_date.blank? || start_date.blank?
#
#   if end_date < start_date
#     errors.add(:end_date, "cannot be before the start date")
#   end
end
