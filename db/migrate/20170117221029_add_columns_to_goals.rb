class AddColumnsToGoals < ActiveRecord::Migration
  def change
  	add_column :goals, :active, :boolean, :default => true
  	add_column :goals, :deadline, :date
  end
end
