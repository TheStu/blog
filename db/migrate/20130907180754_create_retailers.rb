class CreateRetailers < ActiveRecord::Migration
  def change
    create_table :retailers do |t|
      t.string :name
      t.string :url
      t.text :what_i_say
      t.text :what_they_say
      t.boolean :cottage_industry

      t.timestamps
    end
  end
end
