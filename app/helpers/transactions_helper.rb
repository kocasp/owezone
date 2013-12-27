module TransactionsHelper
	def handle_details(transaction, debt_ids, amounts)
		#save spendings
		@spent = 0
		@split = 0
		@spendings = []
		amounts.each do |amount|
			cash = amount[1].to_f
			person_id = amount[0].to_i
			if cash != 0
				@spent += cash
				@spendings << Spending.create(:person_id => person_id, :amount => cash)
			end
		end
		#count debts
		@split = @spent/debt_ids.count
		debt_ids.each do |debt|
			@spendings << Spending.create(:person_id => debt.to_f, :amount => -@split)
		end
		raise Exception
	end
end
