class DropColumnsFromMicroposts < ActiveRecord::Migration
  def change
  	remove_column :microposts, :public
  	remove_column :microposts, :time
  end
end
