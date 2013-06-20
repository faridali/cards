class CreatePublishes < ActiveRecord::Migration
  def change
    create_table :publishes do |t|
      t.references :status
      t.timestamps
    end
    add_index :publishes, :status_id
  end
end
