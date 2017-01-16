class RemoveSecondsFromMicroposts < ActiveRecord::Migration
  def change
  	remove_column :microposts, :seconds
  end
end
