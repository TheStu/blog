class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :post_id
      t.string :merchant_name
      t.string :product_name
      t.string :brand
      t.string :retail_price
      t.string :sale_price
      t.string :buy_url

      t.timestamps
    end
    add_index :products, :post_id
  end
end
