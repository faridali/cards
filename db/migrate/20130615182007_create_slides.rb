class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.text :content
      t.references :status

      t.timestamps
    end
    add_index :slides, :status_id
  end
end
