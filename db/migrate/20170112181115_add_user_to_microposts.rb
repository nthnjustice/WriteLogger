class AddUserToMicroposts < ActiveRecord::Migration
  def change
  	add_column :microposts, :author, :string
  end
end
