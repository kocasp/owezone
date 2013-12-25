class CreateEventAccesses < ActiveRecord::Migration
  def change
    create_table :event_accesses do |t|
      t.string :access_type, :default => "editor"
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
  end
end
