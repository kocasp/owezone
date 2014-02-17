module TransactionsHelper
	def handle_details(transaction_id, debt_ids, amounts, edit = false)
		if edit == true
			Spending.delete_all("transaction_id = #{@transaction.id}")
		end
		#save spendings
		@spent = 0
		@split = 0
		@spendings = []
		amounts.each do |amount|
			cash = amount[1].to_f
			person_id = amount[0].to_i
			if cash != 0
				@spent += cash
				@spendings << Spending.create(:person_id => person_id, :amount => cash, :transaction_id => transaction_id)
			end
		end
		#count debts
		@split = @spent/debt_ids.count
		debt_ids.each do |debt|
			@spendings << Spending.create(:person_id => debt.to_f, :amount => -@split, :transaction_id => transaction_id)
		end
	end

	def get_debt_ids
		debt_ids = []
		Spending.where("amount < 0 AND transaction_id = #{@transaction.id}").each do |s|
			debt_ids << s.person_id
		end
		debt_ids
	end

	def get_amounts
		amounts = {}
		Spending.where("amount > 0 AND transaction_id = #{@transaction.id}").each do |s|
			amounts[s.person_id] = s.amount
		end
		amounts
	end
end
