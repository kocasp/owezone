class Transaction < ActiveRecord::Base
	belongs_to :event
	has_many :spendings, dependent: :destroy
end
