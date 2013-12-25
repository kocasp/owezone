class Event < ActiveRecord::Base
	has_many :event_accesses
	has_many :users, :through => :event_accesses
	has_many :transactions
	has_many :people
end
