class CreateUsers < ActiveRecord::Migration[5.0]
  def change
  drop_table :users
  
  
    create_table :users do |t|
      t.string :name
      t.string :hashed_password
      t.string :salt

      t.timestamps
    end
  end
end
