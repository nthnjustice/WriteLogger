class AddTotalTimeToMicroposts < ActiveRecord::Migration
  def change
  	add_column :microposts, :total, :integer
  end
end
