class AddTransactionIdToSpending < ActiveRecord::Migration
  def change
    add_column :spendings, :transaction_id, :integer
  end
end
