class CreateRecipients < ActiveRecord::Migration[5.0]
  def change
    create_table :recipients do |t|
      t.integer :reminder_id
      t.integer :contact_id

      t.timestamps(null: false)
    end
  end
end

