class Event < ActiveRecord::Base
	has_many :event_accesses, dependent: :destroy
	has_many :users, :through => :event_accesses
	has_many :transactions, dependent: :destroy
	has_many :people, dependent: :destroy
end
