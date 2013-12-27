class Person < ActiveRecord::Base
	belongs_to :event
	has_many :spendings
end
