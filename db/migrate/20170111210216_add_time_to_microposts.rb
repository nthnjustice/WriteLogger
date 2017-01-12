class AddTimeToMicroposts < ActiveRecord::Migration
  def change
  	add_column :microposts, :hours, :integer
  	add_column :microposts, :minutes, :integer
  	add_column :microposts, :seconds, :integer
  	change_column :microposts, :hours, :integer, :null => false
  	change_column :microposts, :minutes, :integer, :null => false
  	change_column :microposts, :seconds, :integer, :null => false
  end
end
