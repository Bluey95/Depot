class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.string :image
      t.string :title
      t.integer :duration
      t.integer :cost
      t.string :category
      t.string :language
      t.string :level
      t.text :description

      t.timestamps
    end
  end
end
