class CreateCitations < ActiveRecord::Migration
  def change
    create_table :citations do |t|
      t.integer :post_id
      t.string :text
      t.string :url

      t.timestamps
    end
  end
end
