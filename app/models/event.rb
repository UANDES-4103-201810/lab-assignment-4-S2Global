class Event < ApplicationRecord
  belongs_to :place
  has_many :tickets
  validate :date_cannot_be_in_the_past
  validate :date_clash

  def date_cannot_be_in_the_past
    if self.start_date < Date.today
      errors.add(:start_date, "can't be before creation")
    end
  end

  def date_clash
    if Event.exists?(place: self.place, start_date: self.start_date)
      errors.add(:start_date, "place used on that date")
    end
  end

end
