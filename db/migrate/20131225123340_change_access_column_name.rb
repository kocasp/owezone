class ChangeAccessColumnName < ActiveRecord::Migration
  def change
  	rename_column :event_accesses, :type, :access_type
  end
end
