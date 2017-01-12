class UpdateMicropostColumns < ActiveRecord::Migration
  def change
  	change_column :microposts, :content, :text, :default => "omitted"
  	change_column :microposts, :title, :string, :null => false
  end
end
