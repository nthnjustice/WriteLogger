class AddTimeToMicropost < ActiveRecord::Migration
  def change
  	add_column :microposts, :time, :string
  end
end
