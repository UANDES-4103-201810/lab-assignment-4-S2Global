class UserTicket < ApplicationRecord
  belongs_to :user
  belongs_to :ticket
  validate :ticket_past
  validate :paid_true

  def ticket_past
    if Date.today > self.ticket.event.start_date
      errors.add(:created_at, "ticket passed")
    end
  end

  def paid_true
    if UserTicket.exists?(paid: false) # If one user's ticket is unpaid.
      errors.add(:paid, "ticket unpaid")
    end
  end

end
