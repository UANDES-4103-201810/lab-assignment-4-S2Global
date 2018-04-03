class User < ApplicationRecord
  has_many :user_tickets
	has_many :tickets, :through => :user_tickets
  validates :email, :format => /.+@.+\..+/i
  validates_length_of :phone, :maximum => 12
  validates_length_of :phone, :minimum => 9
  validates_length_of :password, :maximum => 12
  validates_length_of :password, :minimum => 8

end
