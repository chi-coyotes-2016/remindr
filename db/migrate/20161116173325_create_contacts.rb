nsclass CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.integer :user_id
      t.string :phone_number
      t.string :name
      
      t.timestamps(null: false)
    end
  end
end
