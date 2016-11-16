class AddIndexToReminders < ActiveRecord::Migration[5.0]
  def change
    add_index :reminders, :time_to_go_out
  end
end
