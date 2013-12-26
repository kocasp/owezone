class CreateSpendings < ActiveRecord::Migration
  def change
    create_table :spendings do |t|
      t.float :amount
      t.integer :person_id

      t.timestamps
    end
  end
end
