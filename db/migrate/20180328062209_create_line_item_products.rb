class CreateLineItemProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :line_item_products do |t|
      t.references :productsonsale, foreign_key: true
      t.belongs_to :cart, foreign_key: true

      t.timestamps
    end
  end
end
