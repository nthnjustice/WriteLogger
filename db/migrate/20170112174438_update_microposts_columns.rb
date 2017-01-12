class UpdateMicropostsColumns < ActiveRecord::Migration
  def change
  	remove_column :microposts, :content
  end
end
