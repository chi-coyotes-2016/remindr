class CreateGroupings < ActiveRecord::Migration[5.0]
  def change
    create_table :groupings do |t|
      t.integer :contact_id
      t.integer :group_id

      t.timestamps(null: false)
    end
  end
end
