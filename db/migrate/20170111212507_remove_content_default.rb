class RemoveContentDefault < ActiveRecord::Migration
  def change
  	change_column :microposts, :content, :text, :default => nil
  end
end
