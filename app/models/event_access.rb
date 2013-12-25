class EventAccess < ActiveRecord::Base
	belongs_to :event
	belongs_to :user
	validates_uniqueness_of :event, :scope => [:user]
end
