class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.string :title
      t.datetime :start
      t.datetime :stop
      t.string :beautician
      t.integer :account_id

      t.timestamps
    end
    add_index :schedules, :beautician
    add_index :schedules, :account_id
  end
end
