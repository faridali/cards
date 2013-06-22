class AddUserIdToPublishes < ActiveRecord::Migration
  def change
  	add_column :publishes, :user_id, :integer
  	add_index :publishes, :user_id
  end
end
