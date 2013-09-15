class CreateInternalCategories < ActiveRecord::Migration
  def change
    create_table :internal_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
