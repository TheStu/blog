class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :tagged_posts

      t.timestamps
    end
  end
end
