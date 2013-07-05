class CreateDotds < ActiveRecord::Migration
  def change
    create_table :dotds do |t|
      t.string :product_name
      t.string :brand
      t.string :retail_price
      t.string :sale_price
      t.string :small_image_url
      t.text :buy_url
      t.string :percent_off
      t.string :price_difference
      t.string :merchant_name

      t.timestamps
    end
  end
end
