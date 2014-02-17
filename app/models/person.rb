class Person < ActiveRecord::Base
	belongs_to :event
	has_many :spendings, dependent: :destroy

	def balance
		#raise Exception
		Spending.where("person_id = #{self.id}").sum("amount")
	end

end
