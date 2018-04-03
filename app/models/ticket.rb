class Ticket < ApplicationRecord
  belongs_to :event
  has_many :user_tickets
  has_many :users, through: :user_tickets
  validates :price, :numericality => { :greater_than_or_equal_to => 0 }
  validate :event_past

  def event_past
    if Date.today > self.event.created_at
      errors.add(:created_at, "event passed")
    end
  end

end
