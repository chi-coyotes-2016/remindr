class CreateReminders < ActiveRecord::Migration[5.0]
  def change
    create_table :reminders do |t|
      t.text :body
      t.integer :author_id
      t.date :time_to_go_out
      t.integer :number_of_recurrences
      t.string :time_of_recurrence

      t.timestamps(null: false)
    end
  end
end
