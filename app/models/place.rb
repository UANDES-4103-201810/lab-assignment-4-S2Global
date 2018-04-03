class Place < ApplicationRecord
	has_many :events
	validates_length_of :name, :minimum => 20
	validates :capacity, :numericality => { :greater_than_or_equal_to => 0 }
end
