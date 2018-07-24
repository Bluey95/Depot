class CreateBeauticians < ActiveRecord::Migration[5.0]
  def change
    create_table :beauticians do |t|
      t.string :image_url
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.text :bio
      t.string :experience
      t.integer :user_id

      t.timestamps
    end
    add_index :beauticians, :user_id
  end
end
