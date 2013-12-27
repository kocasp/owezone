class Spending < ActiveRecord::Base
	belongs_to :transaction
	belongs_to :person
end
