module EventsHelper

	def get_settlements
		balances = []
		settlements = []
		@event.people.each do |p|
			balances << [p.id, p.balance]
		end

		settlements = []
		balances.sort! {|a,b| a[1] <=> b[1]}
		step = 0
		while balances[0][1] < -0.01 do
			if -balances[0][1] <= balances.last[1] # debt is smaller than a credit
				settlements << {:from_id => balances[0][0],:amount => -balances[0][1],:to_id => balances.last[0]}
				balances.last[1] += 	balances[0][1]
				balances[0][1] = 0
				balances.sort! {|a,b| a[1] <=> b[1]}
				step += 1
			else # debt is bigger than a credit
				settlements << {:from_id => balances[0][0],:amount => -balances.last[1],:to_id => balances.last[0]}
				balances[0][1] += balances.last[1]
				balances.last[1] = 0
				balances.sort! {|a,b| a[1] <=> b[1]}
				step += 1
			end

		end
		return settlements
	end


end