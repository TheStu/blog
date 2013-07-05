class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :ad_content
      t.string :ad_url
      t.string :merchant_name

      t.timestamps
    end
  end
end
