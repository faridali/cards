class AddStatusIdToPublishes < ActiveRecord::Migration
  def change
  	add_column :publishes, :status_id, :integer
  	add_index :publishes, :status_id
  end
end
